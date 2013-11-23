class SessionsController < ApplicationController

  def new
  end

  def create
    customer = Customer.authenticate(params[:username], params[:password])
    unless customer.blank?
      session[:customer_id] = customer.id
      redirect_to '/order/insert'
      #, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "/customer/login"
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to '/customer/login'
    #, :notice => "Logged out!"
  end



end
