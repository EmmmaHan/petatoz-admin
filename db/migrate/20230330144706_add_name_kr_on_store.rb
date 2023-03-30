class AddNameKrOnStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :name_kr, :string, after: :name_eng, limit: 100
  end
end
