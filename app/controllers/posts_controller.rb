class PostsController < ApplicationController
  before_action :set_q, except: :index_five

  def index; end

  def show
    @post = Post.find(params[:id])
  end

  def indexfive
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).limit(5)
  end

  private

  def set_q
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
