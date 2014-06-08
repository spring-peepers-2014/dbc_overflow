class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: 'Account successfully created.'
      session[:user_id] = @user.id
    else
      format.html { render action: 'new' }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to @user
  end

  def login
    @user = User.new
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def verify
    @user = User.find_by_email(params[:user][:email])
    if @user.password_digest == params[:user][:password]
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end


end
