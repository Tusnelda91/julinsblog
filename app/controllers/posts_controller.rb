class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @post = Post.new(params[:post])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
     if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

 def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end
 

  def update
     @post = Post.find(params[:id])
     if 
       @post.update_attributes(post_params)
       redirect_to posts_path
     else
      render "edit"
     end
  end

  #def destroy
    #@post = Post.find(params[:id])
    #@post.destroy
    #redirect_to posts_path
  #end

  def post_params
    params.require(:post).permit(:title, :content)
  end


end


