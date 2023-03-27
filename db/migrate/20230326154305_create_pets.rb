class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name, null: true, limit: 100, default: ""
      t.string :type, null: false, limit: 50, default: ""
      t.string :breed, null: false, limit: 100, default: "undefined"
      t.string :gender, null: false, limit: 100, default: "undefined"
      t.string :weight, null: false, limit: 100, defaut: "undefined"
      t.boolean :neutered, null: false, default: false
      t.datetime :birthday, null: true
      t.integer :age, null: true
      t.text :memo
      t.timestamps
    end
  end
end


