class OrderController < ApplicationController
  def insert

    @order = Order.new
    #system('/home/vahid/Desktop/shell.sh')

    #ActiveRecord::Base.connection.execute("CREATE DATABASE drupal")
    #database = system 'mysql -u root --password=123qwe drupal < /var/www/drupal.sql'

    #if result.nil?
    # @text= 'Error was #{$?}'
    # elsif result
    # @text= 'You made it!'
    # end
  end

  def createOrder

    @order = Order.new(post_params)
    @order.customerId=1

    if @order.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to '/order/insert'
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render 'insert'
    end

  end


  private
  def post_params
    params.require(:order).permit(:sitename, :productId, :domainId)
  end

end
