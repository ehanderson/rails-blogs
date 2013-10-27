class PostsController < ApplicationController

  def new
    @post = Post.new  #we need an object here upon redering below
  end

  def create
    # render text: params[:post].inspect   ###This will give us a params print out
    #### .permit allos us to take mult params and deal w validations in this action
       @post = Post.new(params[:post])
    # @post = Post.new(post_params)
    if @post.save  #this is a boolean
      redirect_to @post
    else 
      render 'new' #render method is uses so @post object will be passed back to new template
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end



  def index
    @posts = Post.all
  end


  # private
  # #prevents attackers from setting model's attributes - look up 'Strong Params'
  #   def post_params
  #     params.require(:post).permit(:title, :post)
  #   end
end
