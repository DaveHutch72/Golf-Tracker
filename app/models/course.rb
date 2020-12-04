class Course < ApplicationRecord
    has_many :rounds
    has_many :courses, through: :rounds
end
