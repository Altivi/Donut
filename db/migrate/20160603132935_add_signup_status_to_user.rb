class AddSignupStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :signup_status, :string, default: "identifying"
  end
end
