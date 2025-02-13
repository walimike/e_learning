class AddDurationToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :duration, :integer
  end
end
