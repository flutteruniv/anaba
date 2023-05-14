import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { verifyStripeWebhook } from './verifyStripeWebhook'

const CHECKOUT_WEBHOOK_KEY = functions.config().secret.checkout_webhook_key

export const checkoutWebHook = functions.region(`asia-northeast1`).https.onRequest(async (request, response) => {
  console.log(`webhook!`)
  const signature = request.headers[`stripe-signature`]
  // 認証に成功すればeventが返却される
  const event = verifyStripeWebhook(request, response, signature, CHECKOUT_WEBHOOK_KEY)

  if (event == null) {
    response.status(400).end()
    return
  }

  console.log(`event.type: ${event.type}`)

  switch (event.type) {
    case `checkout.session.completed`: {
      const session: any = event.data.object

      if (session.payment_status === `paid`) {
        fulfillOrder(session)
      }

      break
    }
    case `checkout.session.async_payment_succeeded`: {
      const session = event.data.object
      fulfillOrder(session)
      break
    }

    default:
      response.status(200).end()
      console.log(`Unhandled event type ${event.type}`)
      return
  }
})

// 購入した時にそのドキュメントIDをListに加える
// https://stripe.com/docs/api/checkout/sessions/object
const fulfillOrder = async (session: any) => {
  const customerId = session.customer
  console.log(`customerId: ${customerId}`)

  const documentId = session.metadata.documentId

  console.log(`documentId: ${documentId}`)

  const qds = await admin.firestore().collection(`users`).where(`customerId`, `==`, customerId).get()

  // 購入したドキュメントIDを追加
  await qds.docs[0].ref.update({
    anabas: admin.firestore.FieldValue.arrayUnion(documentId)
  })

  console.log(`Complete`)
}
