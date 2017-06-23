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
    result = attempt_sale(@amount, params[:nonce])
    puts result

    if result.success?
      puts "success!: #{result.transaction.id}"
      Charge.create_from_transaction(result.transaction, current_user)
      current_user.credit_purchase!(@amount)
      flash[:success] = "Purchase successful! You're balance has been updated"
      redirect_to root_url
    elsif result.transaction
      log_error(result)
      flash[:danger] = "Payment could not be processed"
      redirect_to new_charge_path
    else
      p result.errors
      flash[:danger] = "Payment could not be processed"
      redirect_to new_charge_path
    end
  end

  private

  def attempt_sale(amount, nonce)
    Braintree::Transaction.sale(
      amount: amount,
      payment_method_nonce: nonce,
      options: {
        submit_for_settlement: true
      }
    )
  end

  def log_error(result)
    puts "Error processing transaction:"
    puts "  code: #{result.transaction.processor_response_code}"
    puts "  text: #{result.transaction.processor_response_text}"
  end

  def set_amount
    @amount = 2001
  end

end
