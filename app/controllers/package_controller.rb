class PackageController < ApplicationController

  def sell

      @package = Package.new
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

      @package = Package.new(post_params)
      if @package.save
        flash[:notice] = "You signed up successfully"
        flash[:color]= "valid"
        redirect_to '/package/sell'
      else
        render json: @package.errors.messages and return
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
        render 'sell'
      end

  end

  private
  def post_params
    params.require(:package).permit(:username,:email,:password,:repassword,:siteName)
  end


end
