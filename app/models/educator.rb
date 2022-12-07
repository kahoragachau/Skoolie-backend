class Educator < ApplicationRecord
    belongs_to :class
    has_many :students
end
