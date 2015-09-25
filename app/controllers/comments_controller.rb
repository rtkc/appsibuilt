class CommentsController < ApplicationController
before_action :require_user

#Don't forget to create/declare a new Comment object in Post/App!!!
  def create
    @app = App.find(params[:app_id]) #:app_id rather than :id, since :id refers to :comment_id?
    @comment = @app.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = 'Your comment has been created.'
      redirect_to app_path(@app)
    else 
      flash[:error] = "Your comment failed to save. Please try again"
      render 'apps/show'
    end
  end

  def index 
    @comment = Comment.all
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end