class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  def generate_script
    @user = User.find(params[:id])
    @script = @user.generate_script
  end
end
