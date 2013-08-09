class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # flash[:success] = "Successful user signup!"
      sign_in(@user)
      # redirect_to subscriptions_new_path
    else
      flash[:error] = "Please try again"
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  def generate_script
    @user = User.find(params[:id])
    @script = @user.generate_script
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
