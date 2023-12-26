class CreateListingAps < ActiveRecord::Migration[7.1]
  def change
    create_table :listing_aps do |t|
      t.date :date
      t.text :email
      t.text :master_name
      t.timestamps
    end
  end
end
