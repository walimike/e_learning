module ApplicationHelper
  def extract_video_id(url)
    if url =~ /(?:https?:\/\/(?:www\.)?youtube\.com\/(?:[^\/]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|https?:\/\/(?:www\.)?youtu\.be\/)([a-zA-Z0-9_-]{11})/
      $1
    else
      nil
    end
  end

  def user_initials(full_name)
    full_name.split.map { |name| name[0] }.join.upcase
  end

  def is_admin
    current_user.role == 'admin'
  end
end
