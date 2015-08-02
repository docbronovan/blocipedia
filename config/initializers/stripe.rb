# Set our app-stored secret key with Stripe
Stripe.api_key = Figaro.env.stripe_api_key 