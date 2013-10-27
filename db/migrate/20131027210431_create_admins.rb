class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :lastname
      t.integer :type
      t.references :country, index: true

      t.timestamps
    end
  end
end
