class CustomerController < ApplicationController

  def insert

    @customer = Customer.new
    # end
  end

  def createCustomer

    @customer = Customer.new(post_params)
    if @customer.save
      redirect_to root_url, :notice => "Signed up!"
      redirect_to '/customer/insert'
    else
      render 'insert'
    end

  end

  private
  def post_params
    params.require(:customer).permit(:username,:email,:password,:repassword)
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
