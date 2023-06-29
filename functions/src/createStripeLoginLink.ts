import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { stripe } from './stripe'

/**
 * 講師になった人がExpressダッシュボードへのリンクを取得する
 */
export const createStripeLoginLink = functions.region(`asia-northeast1`).https.onCall(async (_, context) => {
  const uid = context.auth!.uid
  const ds = await admin.firestore().collection(`users`).doc(uid).get()
  const data = ds.data()
  const stripeAccountId = data?.stripeAccountId
  if (stripeAccountId == null) {
    throw new functions.https.HttpsError(`not-found`, `Not found stripeAccountId`)
  }
  const loginLink = await stripe.accounts.createLoginLink(stripeAccountId)
  const url = loginLink.url
  return url
})
