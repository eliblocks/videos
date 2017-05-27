class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]

  def new

  end

  def index
  end

  def create
    # Amount in cents

    if current_user.customer
      customer_id = current_user.customer.stripe_customer_id
    else
      customer = Stripe::Customer.create(
        email: current_user.email,
        source: params[:stripeToken]
      )
      Customer.create_from_stripe(customer, current_user)
      customer_id = customer.id
    end

    begin
      charge = Stripe::Charge.create(
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
        customer: customer_id
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    Source.create_from_stripe(charge, current_user)
    Charge.create_from_stripe(charge, current_user)

    @seconds_purchased = (@amount/100) * Rails.configuration.rate
    current_user.update!(balance: current_user.balance + @seconds_purchased)

    redirect_to root_url
  end



  private

  def set_amount
    @amount = 1000
  end

end
