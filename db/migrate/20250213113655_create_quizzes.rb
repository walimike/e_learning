class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.references :lesson, null: false, foreign_key: true
      t.text :question

      t.timestamps
    end
  end
end
