import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import Stripe from 'stripe'

admin.initializeApp()

const stripe = new Stripe(functions.config().secret.stripe_api_key, {
  apiVersion: `2022-11-15`
})

export const createStripeAccount = functions.region(`asia-northeast1`).https.onCall(async (_, context) => {
  const uid = context.auth?.uid
  if (uid == null) {
    throw new functions.https.HttpsError(`invalid-argument`, `Not found uid`)
  }
  const userRecord = admin.auth().getUser(uid)
  const email = (await userRecord).email
  if (uid == null) {
    throw new functions.https.HttpsError(`invalid-argument`, `Not found email`)
  }
  const account = await stripe.accounts.create({
    type: `express`,
    country: `JP`,
    email: email,
    business_type: `individual`,
    metadata: { firebaseUID: uid },
    business_profile: {
      // コンサルティング https://stripe.com/docs/connect/setting-mcc
      mcc: `7392`,
      url: `https://anaba.app`,
      product_description: `Anabaで飲食店や観光スポットなどの穴場情報を提供します。`
    }
  })

  admin.firestore().collection(`users`).doc(uid).update({
    stripeAccountId: account.id
  })

  const accountLink = await stripe.accountLinks.create({
    account: account.id,
    /// FIXME: refresh_url は何を与えると適切か。調査。
    refresh_url: `https://anaba.app`,
    return_url: `https://anaba.app`,
    type: `account_onboarding`
  })

  return accountLink.url
})
