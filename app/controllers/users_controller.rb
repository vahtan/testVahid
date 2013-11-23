class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(post_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "new"
  end




  private
  def post_params
    params.require(:user).permit(:username,:email,:password,:repassword)
  end

end

