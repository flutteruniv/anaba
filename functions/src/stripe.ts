import * as functions from 'firebase-functions'
import Stripe from 'stripe'

export const stripe = new Stripe(functions.config().secret.stripe_api_key, {
  apiVersion: `2022-11-15`
})
