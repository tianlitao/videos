require 'will_paginate'
class WelcomeController < ApplicationController
  layout 'front_end'
  skip_before_filter :verify_authenticity_token, only: [:get_channel_more]

  def index

    @channel = Column.hexie.shunxu
    @videos = Video.recent.hexie.paginate(:per_page=>9,:page=> 1)
  end

  def get_index_more
    @videos = Video.recent.hexie.paginate(:per_page=>9,:page=> params[:page])
    render :partial => 'shared/more_videos', layout: false
  end

  def channel
    if Column.find_by_english(params[:english])
      @channel = Column.find_by_english(params[:english])
      @videos = Video.recent.where(:column_id => @channel.id).paginate(:per_page=>9,:page=> 1)
      if params[:english] =='Fucking'
        if current_user.present? && current_user.can_av?
          @channel;@videos
        else
          redirect_to root_path
        end
      else
        @channel;@videos
      end
    else
      redirect_to root_path
    end
  end

  def search
    if params[:video_type].present? && params[:q].present?
      if params[:video_type] == '0'
        @videos = Video.search_from_youku(params[:q])
      end
    else
      redirect_to :back
    end
  end

  def check_search
    if params[:video_type].present? && params[:video_id].present?
      if params[:video_type] == '0'
        @videos = Video.show_video_from_youku(params[:video_id])
      end
    else
      redirect_to :back
    end
  end

  def search_playing
    if params[:video_type].present? && params[:tv_code].present?
      case params[:video_type]
        when '0'
          video = Video.code_to_youku_info(params[:tv_code])
          @video = Video.new(id: 0,column_id:3,recommend: 0,video_type: 0,tv_code: params[:tv_code],duration: video['duration'],
            title: video['title'],cover: video['thumbnail'],created_at: video['published'].to_time,updated_at: video['published'])
          render action: :playing
        else
      end
    else
      redirect_to :back
    end

  end

  def get_channel_more
    @videos = Video.recent.where(:column_id => params[:column]).paginate(:per_page=> 9,:page=> params[:page])
    render :partial => 'shared/more_videos', layout: false
  end

  def playing
    @video = Video.find_by_tv_code!(params[:tv_code])
    @comments = Comment.recent.where(video_id:@video.id)
    if @video.video_type == 3
      unless current_user.present? && current_user.can_av?
        redirect_to root_path
      end
    end
  end

  def interim
    @video = Video.code_to_youku_info(params[:youku_url].gsub('id_',''))
  end

  def feed
    if Column.find_by_english(params[:english]) && params[:english] != 'Fucking'
      @column = Column.find_by_english(params[:english])
      if params[:all] == 'true'
        @videos = Video.recent.where(column_id:@column.id)
      else
        @videos = Video.recent.where(column_id:@column.id).limit(20)
      end
    else
      @videos = Video.hexie.recent.limit(20)
    end
    render 'welcome/feed', layout: false
  end

end
