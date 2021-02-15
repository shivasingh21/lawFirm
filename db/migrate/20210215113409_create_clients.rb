class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :phone_number, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
