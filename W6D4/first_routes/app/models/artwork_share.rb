# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#


class ArtworkShare < ApplicationRecord
  validates :viewer_id, presence: true, uniqueness: true
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  # add_index(:artwork_shares, [:artwork_id, :viewer_id], unique: true)
  # add_index :artwork_shares, :artwork_id, unique: true
  # add_index :artwork_shares, :viewer_id, unique: true

  belongs_to :viewer,
    class_name: :User

  belongs_to :artwork



end
