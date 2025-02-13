class CreateQuizOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_options do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :content
      t.boolean :correct

      t.timestamps
    end
  end
end
