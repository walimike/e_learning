class CreateCertificates < ActiveRecord::Migration[7.1]
  def change
    create_table :certificates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.datetime :issued_at

      t.timestamps
    end
  end
end
