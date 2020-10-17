class CreateHackathons < ActiveRecord::Migration[6.0]
  def change
    create_table :hackathons do |t|
      t.string :name, null: false
      t.text :description
      t.string :url
      t.integer :holding_time

      t.timestamps
    end
    add_index :hackathons, :name
    add_index :hackathons, :holding_time
    add_index :hackathons, :created_at
  end
end
