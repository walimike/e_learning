require 'net/http'
require 'json'

class Lesson < ApplicationRecord
  belongs_to :course
  after_save :fetch_youtube_duration, if: -> { video_url.present? && video_url_changed? }

  private

  def fetch_youtube_duration
    video_id = extract_youtube_video_id(video_url)
    return unless video_id

    api_key = ENV['YOUTUBE_API_KEY']
    url = "https://www.googleapis.com/youtube/v3/videos?id=#{video_id}&part=contentDetails&key=#{api_key}"

    response = Net::HTTP.get(URI(url))
    data = JSON.parse(response)

    if data["items"].any?
      duration_iso = data["items"][0]["contentDetails"]["duration"]
      update_column(:duration, iso8601_to_seconds(duration_iso)) # Update without triggering callbacks
    end
  end

  def extract_youtube_video_id(url)
    regex = %r{(?:youtu\.be/|youtube\.com/(?:embed/|v/|watch\?v=))([\w-]{11})}
    match = url.match(regex)
    match[1] if match
  end

  def iso8601_to_seconds(duration)
    match = duration.match(/PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?/)
    hours = match[1].to_i
    minutes = match[2].to_i
    seconds = match[3].to_i
    (hours * 3600) + (minutes * 60) + seconds
  end
end
