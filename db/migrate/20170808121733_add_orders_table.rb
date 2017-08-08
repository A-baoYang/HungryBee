class AddOrdersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.text :bio
      t.timestamps null: false
    end
  end
end
