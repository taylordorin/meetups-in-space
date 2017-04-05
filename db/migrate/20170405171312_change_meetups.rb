class ChangeMeetups < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetups, :creator_id, :integer, null: false
    add_column :meetups, :user_id, :integer, null: false
  end
end
