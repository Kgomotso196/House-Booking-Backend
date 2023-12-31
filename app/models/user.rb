class User < ApplicationRecord
  has_secure_password

  has_many :houses
  has_many :reservations

  validates :name, presence: true
  validates_uniqueness_of :name
end
