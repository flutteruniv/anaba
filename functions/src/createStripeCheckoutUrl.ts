import * as functions from 'firebase-functions'
import Stripe from 'stripe'
import { stripe } from './stripe'

export const createStripeCheckoutUrl = functions.region(`asia-northeast1`).https.onCall(async (data) => {
  // title: 商品名
  // amount: 価格
  // accountId: 出品者のID
  // customerId: 購入者のID
  // documentId: 商品ID

  console.log(`title ${data.title}`)
  console.log(`amount ${data.amount}`)
  console.log(`accountId ${data.accountId}`)
  console.log(`customerId ${data.customerId}`)
  console.log(`documentId ${data.documentId}`)

  const checkoutSession: Stripe.Checkout.SessionCreateParams = {
    allow_promotion_codes: true,
    billing_address_collection: `auto`,
    success_url: `https://anaba.app`,
    cancel_url: `https://anaba.app`,
    mode: `payment`,
    line_items: [
      {
        price_data: {
          currency: `jpy`,
          product_data: {
            name: data.title
          },
          unit_amount: Number(data.amount)
        },
        quantity: 1
      }
    ],
    metadata: {
      documentId: data.documentId
    },
    payment_intent_data: {
      application_fee_amount: Math.ceil(Number(data.amount) * 0.036 + Number(data.amount) * 0.964 * 0.1),
      transfer_data: {
        destination: data.accountId
      }
    },
    customer: data.customerId
  }
  const session = await stripe.checkout.sessions.create(checkoutSession)
  return session.url
})
