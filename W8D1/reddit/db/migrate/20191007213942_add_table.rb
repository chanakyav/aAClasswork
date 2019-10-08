class AddTable < ActiveRecord::Migration[5.2]
  def change
    create_table :post_sub do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
      t.timestamps
    end

    add_index :post_sub, [:sub_id, :post_id], unique: true
  end
end
