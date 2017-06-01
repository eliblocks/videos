class CheckoutsController < ApplicationController
  # before_action :set_amount, only: [:new, :create]

  def new
    @charge = Charge.new
  end

  def index

  end

  def create
    # env = Spreedly::Environment.new(ENV["SPREEDLY_ID"], ENV["SPREEDLY_SECRET"])
    # gateway = env.add_gateway(:test)
    # transaction = env.purchase_on_gateway(gateway.token,
    #                                       params[:payment_method_token],
    #                                       params[:amount])




    # if transaction.succeeded?
    #   puts "Successfully charged $#{sprintf("%.2f", @amount / 100)} to the card #{credit_card.display_number}"
    #   process(transaction)
    # else
    #   raise StandardError, transaction.message
    # end
    redirect_to root_url
  end



  private

  def process(transaction)

    # charge_id = transaction.charge_id
    # customer_id = transaction.customer_id
    # if current_user.customer
    #   customer_id = current_user.customer.stripe_customer_id
    # else
    #   Customer.create!(user_id: current_user.id, stripe_customer_id: @customer_id)
    # end

    # Charge.create!(amount: @amount, stripe_charge_id: @charge_id, user_id: current_user.id)
    # @seconds_purchased = (@amount/100) * Rails.configuration.rate
    # current_user.update!(balance: current_user.balance + @seconds_purchased)
  end

  def set_amount
    @amount = 1000
  end

end
