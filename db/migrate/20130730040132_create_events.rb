class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :room_booked
      t.string :equipment
      t.text :description
      t.string :job_type
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end
