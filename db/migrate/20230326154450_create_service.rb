class CreateService < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :store, index: true, null: false
      t.string :name, null: true, index: true, limit: 200, default: ""
      t.string :service_type, null: false, index: true, limit: 200
      t.text :description
      t.text :memo
      t.timestamps
    end
  end
end
