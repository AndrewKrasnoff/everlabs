class Admin::PostsController < ApplicationController
  before_action :authorized
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_q

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    # @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to [:admin, @post], success: 'Article was created successfuly'
    else
      flash.now[:danger] = 'Article was not created'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, success: 'Article was updated successfuly'
    else
      flash.now[:danger] = 'Article was not updated'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, success: 'Article was deleted successfuly'
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def set_q
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def post_params
    params.require(:post).permit(:title, :body, :position)
  end
end
