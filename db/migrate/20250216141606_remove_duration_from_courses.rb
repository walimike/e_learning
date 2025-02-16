class RemoveDurationFromCourses < ActiveRecord::Migration[7.1]
  def change
    remove_column :courses, :duration, :integer
  end
end
