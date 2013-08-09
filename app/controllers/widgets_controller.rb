class WidgetsController < ApplicationController
  def index
  end

  def show
    @widget = User.find_by_unique_key(params[:user_id]).widget
    respond_to do |format|
      format.html
      format.json { render json: @widget}
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
