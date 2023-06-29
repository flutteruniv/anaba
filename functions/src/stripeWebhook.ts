import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { verifyStripeWebhook } from './verifyStripeWebhook'

const STRIPE_WEBHOOK_KEY = functions.config().secret.stripe_webhook_key

// TODO(kenta-wakasa): webhookをもう一つ作らないとだめ。
export const stripeWebhook = functions.region(`asia-northeast1`).https.onRequest(async (request, response) => {
  console.log(`webhook!`)
  const signature = request.headers[`stripe-signature`]
  // 認証に成功すればeventが返却される
  const event = verifyStripeWebhook(request, response, signature, STRIPE_WEBHOOK_KEY)

  if (event == null) {
    response.status(400).end()
    return
  }

  console.log(`event.type: ${event.type}`)

  switch (event.type) {
    case `account.updated`:
      // ユーザーを取得
      const account: any = event.data.object
      const detailsSubmitted = account.details_submitted

      console.log(`account: ${JSON.stringify(account)}`)
      console.log(`detailsSubmitted: ${detailsSubmitted}`)

      // firestoreのuserに保存する
      const uid = account.metadata.firebaseUID
      console.log(`uid: ${uid}`)

      if (detailsSubmitted) {
        await admin.firestore().collection(`users`).doc(uid).update({
          detailsSubmitted: detailsSubmitted
        })
      }
      response.status(200).end()
      return

    default:
      response.status(200).end()
      console.log(`Unhandled event type ${event.type}`)
      return
  }
})
