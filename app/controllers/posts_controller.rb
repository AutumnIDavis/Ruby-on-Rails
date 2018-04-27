class PostsController < ApplicationController

  def feed
      @posts = Post.all
  end

  def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

  def users
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts

  end

  def posts
      @user = User.find(params[:id])
      @newpost = Post.create( title: params[:title], content: params[:blog], user_id: current_user.id)
  end

  def update
      @users = User.all
      @newpost = Post.create( title: params[:title], content: params[:blog], user_id: current_user.id)
      redirect_to '/users/:id'
  end

  def account
    @user = User.find_by(params[:session])
  end

  def new
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

end
