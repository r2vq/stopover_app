const functions = require('firebase-functions');
const Firestore = require('@google-cloud/firestore');
const PROJECTID = 'stopover-app-api';
const COLLECTION_CATEGORIES_NAME = 'categories';
const COLLECTION_POIS_NAME = 'pois';

const firestore = new Firestore({
    projectId: PROJECTID,
    timestampsInSnapshots: true,
});

exports.categories = functions.https.onRequest((request, response) => {
    return firestore.collection(COLLECTION_CATEGORIES_NAME)
        .get()
        .then(docs => {
            var res = [];
            docs.forEach(doc => {
                const data = doc.data();
                res.push(data);
            });

            return response.status(200).send(res);
        }).catch(err => {
            console.error(err);
            return response.status(404).send({
                error: 'Unable to retrieve the document'
            });
        });
});

exports.pois = functions.https.onRequest((request, response) => {
    return firestore.collection(COLLECTION_POIS_NAME)
        .get()
        .then(docs => {
            var res = [];
            docs.forEach(doc => {
                const data = doc.data();
                res.push(data);
            });
            return response.status(200).send(res);
        }).catch(err => {
            console.error(err);
            return response.status(404).send({
                error: 'Unable to retrieve the document'
            });
        });
});

exports.poisByCategoryId = functions.https.onRequest((request, response) => {

    const categoryId = request.query.categoryId;
    if (!(categoryId && categoryId.length)) {
        return response.status(404).send({
            error: 'Empty category Id'
        });
    }
    return firestore.collection(COLLECTION_POIS_NAME)
        .get()
        .then(docs => {
            var res = [];
            docs.forEach(doc => {
                            if (categoryId === doc.get("category_id")) {
                                const data = doc.data();
                                res.push(data);
                            }
                        });

            return response.status(200).send(res);
        }).catch(err => {
            console.error(err);
            return response.status(404).send({
                error: 'Unable to retrieve the document'
            });
        });
});

exports.helloWorld = functions.https.onRequest((request, response) => {
    response.send("Hello from Firebase!");
});
