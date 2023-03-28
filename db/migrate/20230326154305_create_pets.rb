class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pet_breeds do |t|
      t.string :pet_type, limit: 100, null: false
      t.string :breed_name, limit: 200, null: false
      t.timestamps
    end

    create_table :pets do |t|
      t.references :user, index: true
      t.string :name, null: true, limit: 100, default: ""
      t.string :pet_type, null: false, limit: 100, default: "dog"
      t.string :breed, null: false, limit: 200, default: "undefined"
      t.string :breed_other, null: true, limit: 100
      t.string :gender, null: false, limit: 100, default: "undefined"
      t.decimal :weight_kg, null: true, limit: 100, default: 0
      t.string :neutered, null: false, default: "unknown"
      t.datetime :birthday, null: true
      t.integer :age, null: true
      t.text :memo
      t.timestamps
    end
  end
end


