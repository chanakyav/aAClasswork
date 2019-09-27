class CommentsController < ApplicationController

  def create
    comment = Comment.new(comments_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(comments_params)

    if comment.destroy
      render json: comment
    else
      render json: comment.errors.full_messages, status: 404
    end 
  end

  def index

    if params.include?(:user_id)
      comments = Comment.where(user_id: params[:user_id])
    else
      comments = Comment.where(artwork_id: params[:artwork_id])
    end
    
    if comments
      render json: comments
    else
      render json: comments.errors.full_messages, status: 404
    end
  end

  private

  def comments_params
    params.require(:comments).permit(:user_id, :artwork_id, :body)
  end

end
