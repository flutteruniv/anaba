import * as functions from 'firebase-functions'
import { stripe } from './stripe'

export const verifyStripeWebhook = (
  request: functions.https.Request,
  response: functions.Response,
  signature: string | string[] | undefined,
  webhookSecretKey: string
) => {
  if (signature === undefined) {
    response.status(400).end()
    return
  }
  try {
    return stripe.webhooks.constructEvent(request.rawBody, signature, webhookSecretKey)
  } catch (e) {
    console.log(`stripe signature is invalid`)
    console.log(e)
    response.status(400).end()
    return
  }
}
