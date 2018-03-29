class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :phone
      t.string :email
      t.text :address
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
