# frozen_string_literal: true

# freetryuser model
class FreeTryUser
  include Mongoid::Document
  belongs_to :user
  validates :vardas, presence: true
  validates :pavarde, presence: true
  validates :pastas, presence: true
  validates :telefonas, format: { with: /\A\d+\z/, message: 'Integer only' }

  field :vardas, type: String
  field :pavarde, type: String
  field :pastas, type: String
  field :telefonas, type: String
end
