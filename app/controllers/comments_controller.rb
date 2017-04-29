class CommentsController < ApplicationController
  # deletes a comment
  def destroy
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @comment = Comment.find(params[:id])
      @post = @comment.post_id
      @comment.destroy

      redirect_to "/posts/#{@post}"
    end
  end
end
