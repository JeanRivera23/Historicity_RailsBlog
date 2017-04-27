class SessionController < ApplicationController

  #sign in form (get method)
  def new
  end


  #user signed in on submit (post method)
  def create
    @user = User.find_by(fname: params[:session][:fname])

    if @user == nil

        flash[:notice] = "Your name or password do not exist."

        session[:user_id] = nil

        redirect_to "/session/new"

    elsif @user && @user.password == params[:session][:password]
          session[:user_id] = @user.id

          redirect_to "/users"
    else
        flash[:notice] = "Your name and password do not match."

        session[:user_id] = nil

        redirect_to "/session/new"
    end
  end


  def destroy
    session[:user_id] = nil
  end
end
