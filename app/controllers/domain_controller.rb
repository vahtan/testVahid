class DomainController < ApplicationController

  def insert
    @domain = Domain.new
  end

  def createDomain

    @domain = Domain.new(post_params)

    if @domain.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to '/domain/insert'
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render 'insert'
    end

  end


  private
  def post_params
    params.require(:domain).permit(:dname, :price)
  end
end
