class CreateLogs < ActiveRecord::Migration
  def change
     create_table :logs do |t|
      t.string :title
      t.string :duration
      t.string :mood
      t.string :location
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
