import { stripe } from './stripe'

export const createStripeCustomer = async (email: string) => {
  return await stripe.customers.create({ email: email }, { idempotencyKey: email })
}
