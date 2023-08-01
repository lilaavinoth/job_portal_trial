const functions = require("firebase-functions");
const stripe = require('stripe')(functions.config().stripe.testkey);
const endpointSecret = functions.config().keys.signing;
const cors = require('cors')({ origin: true });

const admin = require('firebase-admin');
admin.initializeApp();


// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.helloWorld = functions.https.onRequest((request, response) => {
  cors(request, response, async () => {
    functions.logger.info("Hello logs!", { structuredData: true });
    response.send("Hello from Firebase!");

  });
})


exports.reportUsage = functions.https.onRequest(async (req, res) => {
  try {
    const { subscriptionItemId, quantity } = req.body;

    // Create a payment intent with the provided data
    const report = await stripe.subscriptionItems.createUsageRecord(
      subscriptionItemId,
      quantity,
    );

    // res.status(200).json({ clientSecret: report.client_secret });
  } catch (error) {
    console.error('Error creating payment intent:', error);
    res.status(500).json({ error: 'Error creating payment intent' });
  }



});

exports.registerPayment = functions.https.onRequest(async (req, res) => {
  try {
    const { amount, currency, source, description } = req.body;

    // Create a payment intent with the provided data
    const paymentIntent = await stripe.paymentIntents.create({
      amount,
      currency,
      source,
      description,
    });

    // Return the client secret of the created payment intent
    res.status(200).json({ clientSecret: paymentIntent.client_secret });
  } catch (error) {
    console.error('Error creating payment intent:', error);
    res.status(500).json({ error: 'Error creating payment intent' });
  }
});

exports.handleStripeWebhook = functions.https.onRequest(async (req, res) => {
  const sigHeader = req.headers['stripe-signature'];

  try {
    // Verify the webhook event signature
    const event = stripe.webhooks.constructEvent(req.rawBody, sigHeader, 'whsec_uJhBjb1pCfOYgp8oUuEJNzdiqRBifuIs');

    // Handle the 'checkout.session.completed' event
    if (event.type === 'customer.subscription.created') {
      const subscriptionSession = event.data.object.items;
      const stripeCustomerId = event.data.object.customer;
      let UId = '';

      // // Retrieve the Checkout Session ID and perform actions
      // const checkoutSessionId = checkoutSession.id;
      // console.log('Checkout Session ID:', checkoutSessionId);

      // Extract the subscription item ID from the Checkout Session
      const subscriptionItemId = subscriptionSession.data[0].id;
      console.log('Subscription Item ID:', subscriptionItemId);
      console.log('Stripe customer ID:', stripeCustomerId);

      try {
        const customer = await stripe.customers.retrieve(stripeCustomerId);

        console.log('Customer Email:', customer.email);
        console.log('Customer firebaseUID:', customer.metadata.firebaseUID);

        UId = customer.metadata.firebaseUID;
      } catch (error) {
        console.error('Error handling customer data:', error);
        res.status(400).send('Error handling customer data.');
      }

      await addNewFieldToDocument(UId, subscriptionItemId);

      // Perform additional actions based on the successful checkout
      // For example, update subscription status, send confirmation email, etc.

      res.status(200).send('Webhook received and processed successfully.');
    } else {
      // Handle other webhook events if needed
      res.status(200).send('Webhook received and processed successfully.');
    }
  } catch (error) {
    console.error('Error handling webhook event:', error);
    res.status(400).send('Error handling webhook event.');
  }
});

async function addNewFieldToDocument(UId, subscriptionItemId) {
  try {

    console.log('Reached function:', UId + subscriptionItemId);

    // Step 1: Get the reference to the source document
    const sourceDocumentRef = admin.firestore()
      .collection('paymentPendingJobs')
      .doc(UId)
      .collection('pending');

    const deleteDocumentRef = admin.firestore()
      .collection('paymentPendingJobs')
      .doc(UId);

    // Step 2: Create a new document at the destination path and get its reference
    const destinationDocumentRef = admin.firestore().collection('liveJobs').doc();

    // Step 3: Read the data from the source document
    const sourceSnapshot = await sourceDocumentRef.limit(1).get();

    if (!sourceSnapshot.empty) {

      // Step 4: Update the data with additional fields
      const data = sourceSnapshot.docs[0].data();
      data.subItemId = subscriptionItemId; // Add new fields as needed

      // Step 5: Set the updated data to the destination document
      await destinationDocumentRef.set(data);

      try {
        // Step 6: Delete the source document (optional)
        const subcollections = await deleteDocumentRef.listCollections();
        for (const subcollectionRef of subcollections) {
          await deleteCollection(subcollectionRef);
        }

        // Delete the parent document
        await deleteDocumentRef.delete();
      } catch (error) {
        console.error('Error deleting documents:', error);
      }


      console.log('Document moved and fields added successfully.');

    } else {
      console.error('Source document does not exist.');
    }

  } catch (error) {
    console.error('Error moving document and adding fields:', error);
    // throw new functions.https.HttpsError('internal', 'Error moving document and adding fields.');
  }
}


async function deleteCollection(collectionRef) {
  const snapshot = await collectionRef.get();

  if (snapshot.size === 0) {
    return;
  }

  const batch = admin.firestore().batch();
  snapshot.forEach((doc) => {
    batch.delete(doc.ref);
  });

  await batch.commit();
}


// exports.helloWorld = functions.https.onRequest(async (req, res) => {
//   cors(request, response, async () => {
//     await admin.firestore().collection("orders").doc().set({
//       checkoutSessionId: "dataObject.id",
//       paymentStatus: "dataObject.payment_status",
//       shippingInfo: "dataObject.shipping",
//       amountTotal: "dataObject.amount_total",
//     });

//   });
// })