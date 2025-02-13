class Lesson < ApplicationRecord
  belongs_to :course
  # acts_as_list scope: :course 
end
