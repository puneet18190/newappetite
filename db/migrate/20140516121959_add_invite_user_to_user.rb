class AddInviteUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :invite_user, :boolean, :default => false
  end
end
