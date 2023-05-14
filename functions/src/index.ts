import * as admin from 'firebase-admin'

admin.initializeApp()

import { checkoutWebHook } from './checkoutWebhook'
import { createStripeAccount } from './createStripeAccount'
import { createStripeCheckoutUrl } from './createStripeCheckoutUrl'
import { createStripeLoginLink } from './createStripeLoginLink'
import { onCreateUser } from './onCreateUser'
import { stripeWebhook } from './stripeWebhook'

export {
  checkoutWebHook,
  createStripeAccount,
  createStripeCheckoutUrl,
  createStripeLoginLink,
  onCreateUser,
  stripeWebhook
}
