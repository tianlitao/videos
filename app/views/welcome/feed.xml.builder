 xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  cache [ :feed, params[:english], params[:all], @videos.count,@videos.map{|v| v.updated_at}.max ] do
    xml.channle do
      xml.title '^安然^'
      xml.language 'zh-CN'
      xml.link 'http://115.28.226.236:8001/'
      xml.description '安然'
      xml.total @videos.count

      for video in @videos
        xml.item do
          xml.title video.title
          xml.category video_to_column_name(video.column_id)
          xml.youkuid video.tv_code
          xml.link "http://koogle.cc" + video_playing_path(video.tv_code)
          xml.origin_link code_type_to_url(video.tv_code,video.video_type)
          xml.cover video.cover
          xml.description do
            xml.cdata! video.summary.present?? video.summary : "<p><img src='#{video.cover}'></p>"
          end
          xml.pubDate video.created_at.to_s(:rfc822)
        end
      end
    end
  end
end