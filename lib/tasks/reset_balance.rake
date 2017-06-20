desc "Reset User minute balances"
task reset_balance: [:environment] do
  User.includes(:plays, :charges, :payments).find_each do |user|
    new_balance = user.seconds_purchased - user.seconds_played - user.seconds_paid
    user.update(balance: new_balance)
    puts user.balance
  end
end



