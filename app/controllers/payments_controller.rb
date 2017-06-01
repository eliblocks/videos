class PaymentsController < ApplicationController

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(rate: Rails.configuration.rate,
                            amount: params[:dollars].to_i * 100,
                            user_id: current_user.id)
    if @payment.save
      flash[:success] = "Payout successful, you will see the funds in your account in 2-5 business days"
      redirect_to root_url
    else
      render 'new'
    end
    seconds = params[:dollars].to_i * Rails.configuration.rate
    current_user.subtract_balance!(seconds)
  end


  private

  # def payment_params
  #   params.require(:payment).permit(:rate, :user_id, :amount)
  # end


end
