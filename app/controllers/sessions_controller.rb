# class SessionsController < ApplicationController
#   def new
#     redirect_to '/auth/facebook'
#   end

#   def create
#     @auth = request.env['omniauth.auth']
#     if User.find_by(email: @auth.info.email)
#       @user = User.find_by(email: @auth.info.email)
#       @user.process(@auth)
#     else
#       @user = User.new
#       @user.process(@auth)
#       @user.balance = 6000
#     end
#     @user.save
#     reset_session
#     session[:user_id] = @user.id
#     redirect_to root_url
#   end

#   # def test_login
#   #   reset_session
#   #   session[:user_id] = User.find(50).id
#   #   redirect_to root_url
#   # end

#   def destroy
#     reset_session
#     redirect_to root_url
#   end
# end
