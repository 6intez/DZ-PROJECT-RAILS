class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.text :name
      t.text :price

      t.timestamps
    end
  end
end
