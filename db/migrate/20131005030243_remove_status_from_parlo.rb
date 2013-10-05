class RemoveStatusFromParlo < ActiveRecord::Migration
  def change
    remove_column :parlos, :status, :integer
  end
end
