class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(15)
  end

  def show;end

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

  def edit;end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー「#{@user.name}」の情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :age, :picture, :remove_picture)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
