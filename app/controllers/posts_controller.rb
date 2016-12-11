class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index

  	@posts = Post.all
  end

  def show
  
  end

   def edit
  
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new()
  	if @post.update(params.require(:post).permit(:name, :content))
  	 redirect_to posts_url, notice: "L'article a bien été crée"
    else
      render :new
    end
  end

  def update
  
    if @post.update(post_params)
    	redirect_to posts_url, notice: "L'article a bien été modifié"
    else
      render :edit
    end
  end

  def destroy
  	
  	@post.destroy
  	redirect_to posts_url, notice: "L'article a bien été supprimé"
  end

  private

  def set_post

  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:name, :content)
  end
end
