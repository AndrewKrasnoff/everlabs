class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:body))
    if @comment.save
      redirect_to post_path(@post), success: 'Comment was added successfuly'
    else
      redirect_to post_path(@post), danger: 'Comment was not added. Comment can not be blank'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to admin_post_path(@post), success: 'Comment was deleted successfuly'
  end
end
