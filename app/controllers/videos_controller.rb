# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @videos = Video.includes(:user).order('created_at DESC')
  end

  def yours
    @videos = current_user.videos.order('created_at DESC')
    render :grid_view
  end

  def grid_view
    @videos = Video.order('created_at DESC')
  end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = current_user.videos.new(video_params)
    if @video.save
      flash[:success] = I18n.t('messages.add_successful')
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:link)
  end
end
