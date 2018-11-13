class CreatePriceData < ActiveRecord::Migration[5.2]
  def change
    create_table :price_datas do |t|
      t.string :symbol
      t.float :bid
      t.float :ask
      t.float :price

      t.timestamps
    end
  end
end
