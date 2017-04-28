class CommentsController < ApplicationController
  # form to create a comment
  def new
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @comment = Comment.new
      create
    end
  end


  # on submit new comment is created
  def create
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @sesh = session[:user_id]
      @post = Post.find(params[:post_id])
      # puts "here"
      # puts params.inspect

      @comment = Comment.new(
        content: params[:comment][:content],
        post_id: @post,
        user_id: @sesh
      )

      if @comment.save
        redirect_to "/posts/#{@post}"
      end

    end
  end


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
