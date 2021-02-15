class CreateJoinTableClientsServices < ActiveRecord::Migration[5.2]
  def change
    create_join_table :clients, :services do |t|
       t.index :client_id
       t.index :service_id
    end
  end
end
