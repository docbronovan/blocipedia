class ChargesController < ApplicationController
  def create

    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "Blocipedia Premium - #{current_user.email}",
      currency: 'usd'
    )

    current_user.update(role: 'premium')

    flash[:success] = "Thank you for the payment, #{current_user.email}!"
    redirect_to user_path(current_user) # or wherever

  # Stripe will send back CardErrors, with friendly messages
  # when something goes wrong.
  # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key:  Figaro.env.stripe_publishable_key,
      description: "Blocipedia Premium - #{current_user.name}",
      amount: Amount.default
    }
  end
end
