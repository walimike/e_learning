class Course < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_many :lessons, -> { order(:position) } 
  has_many :enrollments

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
end
