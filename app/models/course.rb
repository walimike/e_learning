class Course < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_many :lessons, -> { order(:position) } 
  has_many :enrollments
  has_and_belongs_to_many :bookmarked_users, class_name: "User", join_table: "bookmarks"

  validates :title, :description, :price, presence: true

  def author_name
    self.user.full_name
  end

  def categories
    ["CSS", "HTML"] # Replace with actual logic
  end
  
  def is_enrolled?(user)
    return false unless user 
    enrollments.exists?(user_id: user.id)
  end

  def formatted_duration
    total_minutes = lessons.sum(:duration) || 0
    hours = total_minutes / 60
    minutes = total_minutes % 60
    format("%02dh %02dm", hours, minutes)
  end
end
