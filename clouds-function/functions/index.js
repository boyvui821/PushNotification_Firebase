//TRẢ VỀ NOTIFICATION KHI CÓ THAY ĐỔI TRÊN DATABASE
const functions = require('firebase-functions');
const admin = require('firebase-admin')
admin.initializeApp();

exports.announceProduct = functions.database
  .ref('/products/{productId}')
  .onCreate((snap, context) => {
      const product = snap.val(); // data that was created
      sendNotification(product)
  });

function sendNotification(product){
  const title = product.title
  const cost = product.cost

  const payload = {
    notification:{
      title:'New product available for you',
      body: title +' for $' + cost,
      sound: 'default',
      mutable_content:'true'
    },
    data: {
      imageUrl:'https://www.dhresource.com/0x0s/f2-albu-g5-M01-7C-27-rBVaJFinF2eAQ1iGAASecsF_940703.jpg/new-fashion-casual-men-shirt-long-sleeve.jpg'
    }
  }
  // const payload = {
  //   notification:{
  //     title:'New product available',
  //     body: title +' for $' + cost,
  //     sound: 'default'
  //   }
  // }

  console.log(payload)

  //GỬI THEO SUBCRIBE
  const topic = "newProducts"
  admin.messaging().sendToTopic(topic, payload)
}

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
