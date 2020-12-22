# frozen_string_literal: true

# user model
class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_one :freeTryUser, dependent: :destroy

  validates :vardas, presence: true
  validates :pastas, presence: true
  validates :password_digest, presence: true

  field :vardas, type: String
  field :pastas, type: String
  field :password_digest, type: String
  field :rights, type: String
  has_secure_password

  def authenticate(email, submitted_password)
    user = User.find_by(pastas: email)
    user.password_digest == submitted_password
  end
end
