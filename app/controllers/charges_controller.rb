class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]
  before_action :authorize

  def new
    @charge = Charge.new
  end

  def index
  end

  def create
    respond_to do |format|
      format.js
      format.html {
        puts "before gateway_token"
        gateway_token = Rails.configuration.gateway_token
        puts "before environment"
        env = Spreedly::Environment.new(ENV["SPREEDLY_ID"], ENV["SPREEDLY_SECRET"])
        puts "before purchase"
        transaction = env.purchase_on_gateway(gateway_token, params[:payment_method_token], 2222)
        puts "after purchase"
        if transaction.succeeded?
          Source.create_from_transaction(transaction, current_user)
          Charge.create_from_transaction(transaction, current_user)
          @seconds_purchased = (@amount/100) * Rails.configuration.rate
          current_user.update!(balance: current_user.balance + @seconds_purchased)
        else
        end
      }
    end
    redirect_to root_url
  end



  private

  def set_amount
    @amount = 1000
  end

end
