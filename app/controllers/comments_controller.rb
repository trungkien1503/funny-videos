# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_video

  def create
    @comment = current_user.comments.new(comment_params.merge(video_id: @video.id))
    if @comment.save
      flash[:success] = I18n.t('messages.comments.create_success')
      redirect_to video_url(@video)
    else
      render json: { status: 'not_ok' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def get_video
    @video ||= Video.find(params[:video_id])
  end
end
