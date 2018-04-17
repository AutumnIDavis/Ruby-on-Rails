class PostsController < ApplicationController
  def feed
      @posts = Post.all
  end

  def users
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find( title: params[:title], content: params[:blog], user_id: current_user.id)
  end

end
