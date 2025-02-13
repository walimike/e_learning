class Course < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail

  validates :title, :description, :price, presence: true
end
