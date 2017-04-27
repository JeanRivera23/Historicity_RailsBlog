class PostsController < ApplicationController
  def index
    if session[:user_id] == nil
      redirect_to "/"
    else
     #some code
    end
  end

  def new
    if session[:user_id] == nil
      redirect_to "/"
    end
  end

  def create
    if session[:user_id] == nil
      redirect_to "/"
    else
      #some code
    end
  end

  def show
    if session[:user_id] == nil
      redirect_to "/"
    else
      #some code
    end
  end

  def edit
    if session[:user_id] == nil
      redirect_to "/"
    end
  end

  def update
    if session[:user_id] == nil
      redirect_to "/"
    else
      #some code
    end
  end

  def destroy
    if session[:user_id] == nil
      redirect_to "/"
    else
      #some code
    end
  end
end
