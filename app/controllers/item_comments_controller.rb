class ItemCommentsController < ApplicationController
  def create
    @comment = ItemComment.create(comment_params)
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:item_comment).permit(:comment).merge(user_id:2,item_id:params[:item_id])
    # deviceログイン実装次第追加
    # .merge(user_id: current_user.id)
  end
end
