const functions = require('firebase-functions');
const Firestore = require('@google-cloud/firestore');
const PROJECTID = 'stopover-app-api';
const COLLECTION_CATEGORIES_NAME = 'categories';
const COLLECTION_POIS_NAME = 'pois';

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
      return firestore.collection(COLLECTION_CATEGORIES_NAME)
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


exports.pois = functions.https.onRequest( (request, response) => {

      const id = "QZdanoOQ2cSCZZvixeGU";
      if (!(id && id.length)) {
        return response.status(404).send({ error: 'Empty Id' });
      }
      return firestore.collection(COLLECTION_POIS_NAME)
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

exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello from Firebase!");
});
