class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :name
      t.integer :price
      t.string :color
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
