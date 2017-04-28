class UsersController < ApplicationController

  def index
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      # giving users index page access to all users & posts so  displaying users and posts is possible
      @users = User.all
      @posts = Post.all
      @sesh = session[:user_id]
    end
  end


  # sign up form (get method)
  def new
    @user = User.new
  end


  #sign up form submit creates new user (post method)
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


  # this is the "profile page" it displays the current user
  def show
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      # storing current user (by session) in instance variable so current user data can be accessed and displayed
      @user = User.find(session[:user_id])
    end
  end


  # edit user "profile" form (get method)
  def edit
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(session[:user_id])
    end
  end


  # update user "profile" (put method)
  def update
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @user = User.find(session[:user_id])

      @user.update(
        fname: params[:user][:fname],
        lname: params[:user][:lname],
        password: params[:user][:password]
      )

      redirect_to "/users/:id"
    end
  end


  #to view other users' profiles
  def view_user
    @user = User.find(params[:id])
  end


  #to sign out
  # def sign_out
  # end


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
