# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  
  validates :title, :image_url, presence: true
  validates :image_url, uniqueness: true
  validates :title, uniqueness: { scope: :artist_id }


  # add_index :artworks, [:artist_id, :title], unique: true
  # add_index :artworks, :artist_id



  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    dependent: :destroy

  def self.artworks_for_user_id(user_id)
    Artwork
      .left_outer_joins(:artwork_shares)
      .where('artwork_shares.viewer_id = :user_id OR artworks.artist_id = :user_id', user_id: user_id)
      .distinct
  end

end
