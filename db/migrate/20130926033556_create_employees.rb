class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :lastname
      t.references :company, index: true
      t.references :country, index: true
      t.string :photo

      t.timestamps
    end
  end
end
