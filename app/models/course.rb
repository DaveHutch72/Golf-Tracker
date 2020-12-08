class Course < ApplicationRecord
    belongs_to :type
    belongs_to :users
end
