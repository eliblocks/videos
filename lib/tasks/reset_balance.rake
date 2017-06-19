desc "Reset User minute balances"
task reset_balance: [:environment] do
  User.includes(:plays, :charges, :payments).find_each do |user|
    new_balance = user.seconds_purchased - user.seconds_paid - user.seconds_paid
    puts new_balance
    User.update!(balance: new_balance)
  end
end



