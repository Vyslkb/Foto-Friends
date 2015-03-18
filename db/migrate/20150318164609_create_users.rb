class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.integer :photos
    end

    create_table :photos do |t|
      t.string :url
    end

    create_table :photos_users do |t|
      t.belongs_to(:photos)
      t.belongs_to(:users)
    end
  end
end
