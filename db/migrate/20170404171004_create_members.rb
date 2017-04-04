class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |table|
      table.integer :meetup_id, null: false
      table.integer :user_id, null: false
    end
  end
end
