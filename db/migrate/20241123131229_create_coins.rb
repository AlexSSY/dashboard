class CreateCoins < ActiveRecord::Migration[7.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :price

      t.timestamps
    end
  end
end
