const functions = require("firebase-functions");
const stripe = require('stripe')('sk_test_51NXTFBRfb8vafAMZ2jWoLgeVMZc97iiJAIUGoXCirebpeDaykADEBG6Gtj96lmC6fUupGA6cAiCl4akkjIMOudFM00r9DmaMZ7');
const cors = require('cors')({ origin: true });


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


exports.reportStripeUsage = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    console.log('Request received:', req.query);

    const { subscriptionItemId, quantity } = req.query;

    try {
      // There is no need to retrieve the subscriptionItem if you're just updating the usage quantity.

      // Report the updated usage quantity to Stripe
      await stripe.subscriptionItems.update(subscriptionItemId, {
        quantity: parseInt(quantity, 10),
      });

      res.status(200).send(`Usage reported for Subscription Item ID: ${subscriptionItemId}`);
    } catch (error) {
      console.error('Error reporting usage to Stripe:', error);
      res.status(500).send('Error reporting usage to Stripe');
    }
  });
});



exports.reportUsage = functions.https.onRequest((request, response) => {
  cors(request, response, async () => {
    functions.logger.info("Report usage!", { structuredData: true });

    const stripe = require('stripe')('sk_test_51NXTFBRfb8vafAMZ2jWoLgeVMZc97iiJAIUGoXCirebpeDaykADEBG6Gtj96lmC6fUupGA6cAiCl4akkjIMOudFM00r9DmaMZ7');

    const usageRecord = await stripe.subscriptionItems.createUsageRecord(
      'si_OKp5Khz6SKb0Kq',
      { quantity: 100, timestamp: now }
    );

  });
});