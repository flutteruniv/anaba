import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { stripe } from './stripe'

/**
 * StripeAccountを作成する
 */
export const createStripeAccount = functions.region(`asia-northeast1`).https.onCall(async (_, context) => {
  const uid = context.auth?.uid
  if (uid == null) {
    throw new functions.https.HttpsError(`invalid-argument`, `Not found uid`)
  }
  const userRecord = await admin.auth().getUser(uid)
  const email = userRecord.email
  if (email == null) {
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

<<<<<<< HEAD
  // TODO(kenta-wakasa): この時点でstripeAccountIdを保存せずに、webhookの方でやるべきかも。
  // それか、この処理はアカウント作成が完了している時絶対に呼び出されないようにするべきかも。
=======
>>>>>>> 64e8504 (“コミットテスト”)
  await admin.firestore().collection(`users`).doc(uid).set(
    {
      stripeAccountId: account.id
    },
    {
      merge: true
    }
  )

  const accountLink = await stripe.accountLinks.create({
    account: account.id,
    /// FIXME: refresh_url は何を与えると適切か。調査。
    refresh_url: `https://anaba.app`,
    return_url: `https://anaba.app`,
    type: `account_onboarding`
  })

  return accountLink.url
})
