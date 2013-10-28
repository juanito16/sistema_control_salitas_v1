class AddAdminTypeToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :admin_type, :integer
  end
end
