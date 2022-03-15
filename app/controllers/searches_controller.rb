class SearchesController < ApplicationController
  def index
    @posts = (Post.joins(:body).where('action_text_rich_texts.body LIKE ?', "%#{params[:query]}%"))
             .or(Post.where('title LIKE ?', "%#{params[:query]}%"))

    sort_string_1 = "#{params[:sort_field_1]} #{params[:sort_order_1]}" if params[:sort_field_1] != 'none'
    sort_string_2 = "#{params[:sort_field_2]} #{params[:sort_order_2]}" if params[:sort_field_2] != 'none'
    sort_string_3 = "#{params[:sort_field_3]} #{params[:sort_order_3]}" if params[:sort_field_3] != 'none'

    @posts = @posts.order(sort_string_1).order(sort_string_2).order(sort_string_3)

    @posts = @posts.first(5) if params[:show_result] == 'show_first'
    @posts = @posts.last(5) if params[:show_result] == 'show_last'
  end
end
