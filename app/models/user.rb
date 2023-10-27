class User < ApplicationRecord
  has_many :houses
  has_many :reservations
  validates :name, presence: true
end
