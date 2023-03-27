class CreateService < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name, null: true, index: true, limit: 200, default: ""
      t.string :service_type, null: true, index: true, limit: 200, default: ""
      t.timestamps
    end
  end
end
