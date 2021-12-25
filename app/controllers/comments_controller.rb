class CommentsController < ApplicationController

  def create
    #binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      @prototype = Prototype.find(@comment.prototype.id)
      @comment = Comment.new
      @comments = Comment.includes(:prototype)
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end