class CreateAddSupplyIdToProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :add_supply_id_to_products do |t|
      add_column :products, :supply_id, :integer
      t.timestamps
    end
  end
end
