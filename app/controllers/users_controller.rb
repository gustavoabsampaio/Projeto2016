class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bem vindo! Conta criada!"
      log_in @user
      redirect_to @user
    else
      flash[:danger] = "Não foi possível criar conta"
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	
end
