class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])# 追加: 詳細ページに戻るために必要
    @comments = @prototype.comments # 追加: 詳細ページで表示するために必要

    if @comment.save
      redirect_to prototype_path(@comment.prototype), notice: 'コメントが投稿されました。'
    else
      render :"prototypes/show", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
