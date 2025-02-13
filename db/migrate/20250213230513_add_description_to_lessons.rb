class AddDescriptionToLessons < ActiveRecord::Migration[7.1]
  def change
    add_column :lessons, :description, :text
  end
end
