# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'

class User < ApplicationRecord

  attr_reader :password

  validates :user_name, presence: true
  validates :password_digest, presence: {message: "Password can\'t be blank" }
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :cats,
    foreign_key: :user_id,
    class_name: :Cat


  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(user_name: username)
    return user if user && is_password?(password)
  end

end
