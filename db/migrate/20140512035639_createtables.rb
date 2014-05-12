class Createtables < ActiveRecord::Migration
  def change

    create_table :followers do |t|
      t.string :name
      t.integer :user_id
      t.integer :playlist_id
      t.timestamps
  end

     create_table :playlists do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end

    create_table :tracks do |t|
      t.string :title
      t.string :artist
      t.integer :playlist_id
      t.string :url
      t.string :image

      t.timestamps
    end

    create_table :likes do |t|
      t.integer :user_id
      t.integer :track_id
      t.string :is_liked, :boolean
    end

    add_index :followers, :user_id
    add_index :followers, :playlist_id
    add_index :playlists, :user_id
    add_index :likes, :user_id
    add_index :tracks, :playlist_id
    add_index :likes, :track_id

  end
end
