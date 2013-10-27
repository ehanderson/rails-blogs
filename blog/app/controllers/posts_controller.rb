class PostsController < ApplicationController
  
  def new
    ###### this allows us to call @post.errors.any? in our view. if we didn't it would be nil there.
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params[:post].permit(:title, ,:text))
    
    if @post.save
      redirect_to @post
    else 
      render 'new'
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
   
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
    
    ### this is only needed for ruby 4.0 
    ### else in create puts Post.new(params[:post]) and do not have a private section or a post_params method
  private 
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
