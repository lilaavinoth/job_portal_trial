const functions = require("firebase-functions");
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
    // response.send("Hello from Firebase!");

    // Set your secret key. Remember to switch to your live secret key in production.
    // See your keys here: https://dashboard.stripe.com/apikeys
    const stripe = require('stripe')('sk_test_51NXTFBRfb8vafAMZ2jWoLgeVMZc97iiJAIUGoXCirebpeDaykADEBG6Gtj96lmC6fUupGA6cAiCl4akkjIMOudFM00r9DmaMZ7');

    // The price ID passed from the client
    //   const {priceId} = req.body;
    const priceId = '{{price_1NXq3iRfb8vafAMZnma0Kw3D}}';

    const session = await stripe.checkout.sessions.create({
      mode: 'subscription',
      line_items: [
        {
          price: priceId,
          // For metered billing, do not pass quantity
          quantity: 1,
        },
      ],
      // {CHECKOUT_SESSION_ID} is a string literal; do not change it!
      // the actual Session ID is returned in the query parameter when your customer
      // is redirected to the success page.
      success_url: 'https://example.com/success.html?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: 'https://example.com/canceled.html',


    });

    response.send("Came to end!");


    // Redirect to the URL returned on the Checkout Session.
    // With express, you can redirect with:
    //   res.redirect(303, session.url);

    // Check if the request contains a JSON body
    // if (request.method !== 'POST' || !request.body) {
    //   return response.status(400).json({ error: 'Invalid request. Expected JSON body.' });
    // }

    // try {
    //   // Parse the JSON data from the request body
    //   const inputData = JSON.parse(request.body);

    //   // Process the JSON data (you can perform any required operations here)
    //   // const name = inputData.name || "Anonymous";

    //   // Create a JSON response
    //   const jsonResponse = {
    //     message: `Hello, name! This is the response from Firebase.`,
    //   };

    //   // Send the JSON response back
    //   response.status(200).json(jsonResponse);
    // } catch (error) {
    //   // Handle JSON parsing errors
    //   response.status(400).json({ error: 'Invalid JSON payload.' });
    // }

    // response.send("Hello from Firebase!");
  });
});

