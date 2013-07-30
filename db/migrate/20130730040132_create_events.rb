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

      t.timestamps
    end
  end
end
