class CommentsController < ApplicationController
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

  def destroy
    if session[:user_id] == nil
      redirect_to "/"
    else
      #some code
    end
  end
end
