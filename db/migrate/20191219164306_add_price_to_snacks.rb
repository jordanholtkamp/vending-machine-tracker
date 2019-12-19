class AddPriceToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :snacks, :price, :float
  end
end
