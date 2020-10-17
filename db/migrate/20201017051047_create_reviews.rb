class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :role, null: false
      t.integer :level, null: false
      t.text :comment, null: false
      t.references :user, foreign_key: true
      t.references :hackathon, foreign_key: true

      t.timestamps
    end
  end
end
