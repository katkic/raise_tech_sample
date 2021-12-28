class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to users_path, notice: "ユーザー 「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :age)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
