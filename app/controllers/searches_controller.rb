class SearchesController < ApplicationController
  def index
    @posts = (Post.joins(:body).where('action_text_rich_texts.body LIKE ?', "%#{params[:query]}%"))
             .or(Post.where("title LIKE ?", "%" + params[:query] + "%"))

    sort_string = ''
    sort_string = params[:sort_field_1] + ' ' + params[:sort_order_1] if params[:sort_field_1] != 'none'
    sort_string += ', ' if sort_string != ''
    sort_string += params[:sort_field_2] + ' ' + params[:sort_order_2] if params[:sort_field_2] != 'none'
    sort_string += ', ' if sort_string != '' && params[:sort_field_3] != 'none'
    sort_string += params[:sort_field_3] + ' ' + params[:sort_order_3] if params[:sort_field_3] != 'none'
    @posts = @posts.order(sort_string)

    @posts = @posts.first(5) if params[:show_result] == 'show_first'
    @posts = @posts.last(5) if params[:show_result] == 'show_last'
  end
end
