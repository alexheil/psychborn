class Posts::PostsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.admin_id = current_admin.id
    if @post.save
      flash[:notice] = "you just created " + @post.title + "!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'you messed up, bruh.'
      render 'new'
    end
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def update
    @post = Post.friendly.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "good job"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = 'bad job'
      render 'edit'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id]).destroy
    redirect_to posts_path
    flash[:notice] = "delete successful"
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :category, :slug, :image)
    end

end
