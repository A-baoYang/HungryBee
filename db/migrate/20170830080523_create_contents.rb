class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :nickname
      t.string :title
      t.text :essay

      t.timestamps
    end
  end
end
