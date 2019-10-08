# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post,
    foreign_key: :post_id,
    class_name: :Post

end
