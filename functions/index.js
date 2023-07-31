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


// exports.docListener = functions.https.onRequest((req, res) => {
//   const collectionPath = req.body.collectionPath;

//   // response.send('collectionPath:' + collectionPath);

//   // Check if the collection path is provided in the request body
//   if (!collectionPath) {
//     return res.status(400).json({ error: 'Collection path not provided.' });
//   }

//   // Set up a Firestore listener for the specified collection
//   const collectionRef = admin.firestore().collection(collectionPath);
//   const unsubscribe = collectionRef.onSnapshot(snapshot => {

//     // const timeout = 600000 // 10 minutes
//     const timeout = 10000 // 10 minutes


//     // Set the timeout
//     timeoutId = setTimeout(() => {
//       // If the timeout is reached, unsubscribe from the snapshot listener
//       unsubscribe();

//       // Send a timeout response to the client
//       console.log('Listener timeout reached.');
//     }, timeout);

//     snapshot.docChanges().forEach(change => {
//       if (change.type === 'added') {
//         // This is a newly added document
//         const newData = change.doc.data();
//         // console.log('Newly added document data:', newData);

//         const itemsArray = newData.items;
//         // console.log('Array value:', itemsArray);

//         // Check if the array has elements
//         if (itemsArray.length > 0) {
//           // Access the first element (map) in the array
//           const firstItem = itemsArray[0];

//           // Access the value associated with the key "id"
//           const idValue = firstItem.id;

//           // Now you can use the idValue as needed
//           console.log('Value of "subItemId" key:', idValue);

//           unsubscribe();

//         }

//       }
//     });

//     // Clear the timeout if the listener is successfully unsubscribed before the timeout
//     unsubscribe.then(() => clearTimeout(timeoutId));

//   });
//   // Send a success response to the client
//   return res.status(200).json({ message: 'Listening to collection changes.' });
// });


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
    // const collectionPath = 'paymentPendingJobs/' + UId + '/pending/';

    // Query the collection to check if it has documents
    // const snapshot = await admin.firestore().collection('paymentPendingJobs').doc(UId).collection('pending').limit(1).get();
    const snapshot = await admin.firestore().collection('paymentPendingJobs').doc(UId).collection('pending').get();


    if (snapshot.empty) {
      // The collection is empty
      console.log('Collection is empty.');
      // res.status(200).send('Collection is empty.');
    } else {

      try {

        // Initialize an array to store the documents' data
        const documentsData = [];

        // Get the data of the existing document
        const data = snapshot.data();

        // Add the new field to the document data
        data.subItemId = subscriptionItemId;

        // Write the updated document to the destination collection
        await admin.firestore().collection('liveJobs').doc().set(data);

        // Optionally, delete the original document from the source collection
        // Comment out the following line if you don't want to delete the original document
        await admin.firestore().collection('paymentPendingJobs').doc(UId).delete();

        // res.status(200).send('Document moved successfully.');
      } catch (error) {
        console.error('Error moving document:', error);
        // res.status(500).send('Error moving document.');
      }


      // The collection has documents
      console.log('Collection is not empty.');
      // res.status(200).send('Collection is not empty.');
    }
  } catch (error) {
    console.error('Error adding a new field to the document:', error);
    return null;
  }
}