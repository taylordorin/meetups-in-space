class CreateMeetups < ActiveRecord::Migration[5.0]
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :description, null: false
      table.string :location, null: false
      table.integer :creator_id, null: false
    end
  end
end
