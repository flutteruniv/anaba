import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { createStripeCustomer } from './createStripeCustomer'

export const onCreateUser = functions.firestore.document(`/users/{userId}`).onCreate(async (qds, context) => {
  const uid = qds.ref.id
  if (uid == null) {
    throw new functions.https.HttpsError(`invalid-argument`, `Not found uid`)
  }
  const userRecord = await admin.auth().getUser(uid)
  const email = userRecord.email
  if (email == null) {
    throw new functions.https.HttpsError(`invalid-argument`, `Not found email`)
  }
  const customer = await createStripeCustomer(email)
  await admin.firestore().collection(`users`).doc(uid).set({ customerId: customer.id }, { merge: true })
})
