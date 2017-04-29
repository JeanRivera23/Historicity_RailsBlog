class PostsController < ApplicationController
  # form to create new post (get method)
  def new
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.new
    end
  end


  # on submit, post is created (post method)
  def create
    @sesh = session[:user_id]
    @post = Post.new(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: @sesh
    )

    @post.save

    redirect_to "/posts/#{@post.id}"
  end


  # displays a specific post (get method)
  def show
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.find(params[:id])
      @comments = Comment.all
    end
  end


  # form to edit post (get method)
  def edit
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.find(params[:id])
    end
  end


  # on submit, the post is edited (put method)
  def update
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.find(params[:id])

      @post.update(
        title: params[:post][:title],
        content: params[:post][:content]
      )

      redirect_to "/users/:id"
    end
  end


  #to view other users' posts
  def view_user_post
    @post = Post.find(params[:id])
    @comments = Comment.all
    @users = User.all
    @comment = Comment.new
  end


  # adds comments (post method)
  def add_comment
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.find(params[:id])
      @sesh = session[:user_id]

      @comment = Comment.new(
        content: params[:comment][:content],
        post_id: @post.id,
        user_id: @sesh
      )

      end

      if @comment.save
        redirect_to "/posts/view_user_post/#{@post.id}"
      end

    end


  # deletes a post
  def destroy
    # if there is no session, means user isn't logged in so shouldn't have access to site
    if session[:user_id] == nil
      redirect_to "/"
    else
      @post = Post.find(params[:id])
      @post.comments.destroy
      @post.destroy

      redirect_to "/users/:id"
    end
  end

end
