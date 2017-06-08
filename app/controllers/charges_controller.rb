class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]
  before_action :authorize

  def new
    @charge = Charge.new
  end

  def index
  end

  def create
    env = Spreedly::Environment.new(ENV["SPREEDLY_ID"], ENV["SPREEDLY_SECRET"])
    gateway = env.add_gateway(:test)
    transaction = env.purchase_on_gateway(gateway.token, params[:payment_method_token], 2222)
    if transaction.succeeded?

      Source.create_from_transaction(transaction, current_user)
      Charge.create_from_transaction(transaction, current_user)
      @seconds_purchased = (@amount/100) * Rails.configuration.rate
      current_user.update!(balance: current_user.balance + @seconds_purchased)
    else
      byebug
    end

    redirect_to root_url
  end



  private

  def set_amount
    @amount = 1000
  end

end
