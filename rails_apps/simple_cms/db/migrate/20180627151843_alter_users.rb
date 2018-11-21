class AlterUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_table("users", "admin_users3")
  	add_column("admin_users3","username", :string, :limit => 25, :after => "email")
	rename_column("admin_users3", "password", "hashed_password")
	puts "****Adding an index ****"
	add_index("admin_users3", "username")
	end
end
