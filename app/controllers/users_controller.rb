class UsersController < ApplicationController
  def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

def index
  @users = User.all
  @user = current_user
  @posts = @user.posts
end

def posts
  @users = User.all
  @user = current_user
  @posts = @user.posts
  @newpost = Post.create( title: params[:title], content: params[:blog], user_id: current_user.id)
end

  def update
      @users = User.all
      @newpost = Post.create( title: params[:title], content: params[:blog], user_id: current_user.id)
      redirect_to '/posts'
  end

  def account
    @user = User.find_by(params[:session])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
      @users = User.all
      @user = current_user
      @posts = @user.posts
  end

  def home
      @user = User.find(params[:id])
  end

  def destroy
      User.delete(params[:id])
      redirect_to users_path
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password_confirmation, :password)
  end
end
