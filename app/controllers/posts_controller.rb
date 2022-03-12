class PostsController < ApplicationController
  before_action :set_q
  before_action :set_post, only: :show

  def index
    # @posts = Post.all
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_q
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
