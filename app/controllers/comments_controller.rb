class CommentsController < ApplicationController
  # deletes a comment
  def destroy
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @comment = Comment.find(params[:id])
      @comment.destroy

      redirect_to "/posts/:id"
    end
  end
end
