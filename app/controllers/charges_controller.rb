class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]

  def new

  end

  def index
  end

  def create


    # Source.create_from_stripe(charge, current_user)
    # Charge.create_from_stripe(charge, current_user)

    # @seconds_purchased = (@amount/100) * Rails.configuration.rate
    # current_user.update!(balance: current_user.balance + @seconds_purchased)

    redirect_to root_url
  end



  private

  def set_amount
    @amount = 1000
  end

end
