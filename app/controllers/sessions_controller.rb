class SessionsController < ApplicationController
  def new
    
  end

  def posts
      @users = User.all
  end

  def create
      puts '**********************'
      puts params.inspect
      puts '**********************'
      # Find a user in the database that matches the username in the form.
      @user = User.find_by(username: params[:session][:username])
      # Check if there is a user with that username, and check if the password is that user's password.
      if @user && @user.password == params[:session][:password]
          puts 'LOGIN SUCCESSFUL'
          log_in(@user)
          redirect_to user_path @user
      else
          puts 'LOGIN FAILED'
          redirect_to login_path
      end
  end

  def destroy
      log_out
      redirect_to root_path
  end
end
