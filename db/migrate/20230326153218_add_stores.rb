class AddStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name_eng, null: true, index: true, limit: 200, default: ""
      t.string :name_jp, null: true, index: true, limit: 200, default: ""
      t.text :description, null: true
      t.string :pet_type, null: false, limit: 50, default: "dog_only"
      t.boolean :pickup_available, null: false, index: true, default: false
      t.string :website_url, null: true, index: false
      t.string :status, null: false, index: true, limit: 50
      t.timestamps
    end
  end
end
