class CreateParlos < ActiveRecord::Migration
  def change
    create_table :parlos do |t|
      t.string :name_parlo
      t.integer :status
      t.references :country, index: true

      t.timestamps
    end
  end
end
