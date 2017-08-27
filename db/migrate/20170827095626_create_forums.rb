class CreateForums < ActiveRecord::Migration[5.0]
  def change
    create_table :forums do |t|
      t.string :issue
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
