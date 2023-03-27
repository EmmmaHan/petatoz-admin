class CreateStoreServices < ActiveRecord::Migration[7.0]
  def change
    create_table :store_services do |t|
      t.references :store, index: true
      t.references :service, index: true
      t.timestamps
    end
  end
end
