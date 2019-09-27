class ChangeComments < ActiveRecord::Migration[5.2]
  def change

    remove_column :comments, :user_id
    remove_column :comments, :artwork_id

    add_column :comments, :user_id, :integer
    add_column :comments, :artwork_id, :integer

  end
end
