class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(15)
  end
end
