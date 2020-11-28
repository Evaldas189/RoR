class User
  include Mongoid::Document
  validates :vardas, presence: true
  validates :pavarde, presence: true
  validates :telefonas, format: { with: /\A\d+\z/, message: "Integer only" }

  field :vardas, type: String
  field :pavarde, type: String
  field :pastas, type: String
  field :telefonas, type: String

end
