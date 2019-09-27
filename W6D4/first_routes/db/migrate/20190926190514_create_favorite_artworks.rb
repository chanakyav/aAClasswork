class CreateFavoriteArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_artworks do |t|
  
      t.timestamps
    end
  end
end
