class LikesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])

    @comment.likes.create(user: current_user)
  end
end
