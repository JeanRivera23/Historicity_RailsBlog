class UsersController < ApplicationController

  def index
    if session[:user_id] == nil
      redirect_to "/"
    else
      @users = User.all
      @posts = Post.all
    end
  end

  # sign up form
  def new
    @user = User.new
  end

  #sign up form submit creates new user
  def create
    @user = User.new(
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      password: params[:user][:password]
    )

    @user.save

    #set session after sign up
    session[:user_id] = @user.id

    redirect_to users_path
  end

  def show
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(session[:user_id])
    end
  end

  # edit profile form (get method)
  def edit
    if session[:user_id] == nil
      redirect_to "/"
    end
  end

  # update user profile (post method)
  def update
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(session[:user_id])

      @user.update(
        fname: params[:user][:fname],
        lname: params[:user][:lname],
        password: params[:user][:password]
      )
      # redirect_to users_id_path
    end
  end


  # to delete a user account (delete method)
  def destroy
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(session[:user_id])
      @user.destroy

      session[:user_id] = nil

      redirect_to "/"
    end
  end

end
