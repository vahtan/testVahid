class ProductController < ApplicationController

  def insert

    @product = Product.new
    # end
  end

  def createProduct

    @product = Product.new(post_params)
    if @product.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to '/product/insert'
    else
      #render json: @package.errors.messages and return
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render 'insert'
    end

  end

  private
  def post_params
    params.require(:product).permit(:pname,:price)
  end


end
