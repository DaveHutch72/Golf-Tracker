class Course < ApplicationRecord
    belongs_to :type
    belongs_to :users
    accepts_nested_attributes_for :type, :reject_if => :all_blank, :allow_destroy => true
end
