class Type < ApplicationRecord
  has_many :courses
  has_many :users, through: :courses
  validates :style, presence: true
end
