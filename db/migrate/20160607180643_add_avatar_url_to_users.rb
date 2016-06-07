class AddAvatarUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :medium_avatar_url, :string
    add_column :users, :thumb_avatar_url, :string
    add_column :users, :dropbox_avatar_url, :string
  end
end
