class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.string :user_id, null: false
      t.string :artwork_id, null: false
      t.timestamps
    end

    add_index :comments, :user_id, unique: true
    add_index :comments, :artwork_id, unique: true
  end
end
