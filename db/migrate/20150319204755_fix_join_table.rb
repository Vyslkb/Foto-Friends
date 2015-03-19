class FixJoinTable < ActiveRecord::Migration
  def self.up
      remove_column :photos_users, :photos_id
      remove_column :photos_users, :users_id
      add_column :photos_users, :photo_id, :integer
      add_column :photos_users, :user_id, :integer
  end
end
