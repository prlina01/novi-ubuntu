class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column "admin_users3", "hashed_password", :string
  	add_column "admin_users3", "password_digest", :string
  end
end
