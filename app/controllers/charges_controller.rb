class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]
  before_action :authorize

  def new
    @charge = Charge.new
    @client_token = Braintree::ClientToken.generate
  end

  def index
  end

  def create
    configure_braintree
    nonce = params[:nonce]
    result = Braintree::Transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )
    if result.success?
      puts "success!: #{result.transaction.id}"
      Charge.create_from_transaction(result.transaction, current_user)
      @seconds_purchased = (@amount/100) * Rails.configuration.rate
      current_user.update!(balance: current_user.balance + @seconds_purchased)
      redirect_to root_url
    elsif result.transaction
      puts "Error processing transaction:"
      puts "  code: #{result.transaction.processor_response_code}"
      puts "  text: #{result.transaction.processor_response_text}"
      render 'new'
    else
      p result.errors
      render 'new'
    end
  end

  def configure_braintree
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = ENV["BRAINTREE_ID"]
    Braintree::Configuration.public_key = "bzp6xbxjt6w4fycx"
    Braintree::Configuration.private_key = ENV["BRAINTREE_SECRET"]
  end

  private

  def set_amount
    @amount = 1000
  end

end
