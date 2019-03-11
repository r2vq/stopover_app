const functions = require('firebase-functions');
const Firestore = require('@google-cloud/firestore');
const PROJECTID = 'stopover-app-api';
const COLLECTION_NAME = 'categories';

const firestore = new Firestore({
  projectId: PROJECTID,
  timestampsInSnapshots: true,
});

exports.categories = functions.https.onRequest( (request, response) => {
    // read/retrieve an existing document by id
  
      const id = "DXIQXmuFxAyiW1cYUfH3";
      if (!(id && id.length)) {
        return response.status(404).send({ error: 'Empty Id' });
      }
      return firestore.collection(COLLECTION_NAME)
        .doc(id)
        .get()
        .then(doc => {
          if (!(doc && doc.exists)) {
            return response.status(404).send({ error: 'Unable to find the document' });
          }
          var res = [];
          const data = doc.data();
          res.push(data);
          return response.status(200).send(res);
        }).catch(err => {
          console.error(err);
          return response.status(404).send({ error: 'Unable to retrieve the document' });
        });
      });


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});
