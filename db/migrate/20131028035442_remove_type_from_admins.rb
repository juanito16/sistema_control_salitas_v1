class RemoveTypeFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :type, :integer
  end
end
