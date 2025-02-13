class CreateQuizResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_responses do |t|
      t.references :quiz, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :quiz_option, foreign_key: true

      t.timestamps
    end
  end
end
