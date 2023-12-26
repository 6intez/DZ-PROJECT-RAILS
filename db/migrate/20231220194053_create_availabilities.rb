class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.integer :master_id
      t.date :date
      t.integer :availible

      t.timestamps
    end
  end
end
