class StudentClassroom < ApplicationRecord
    belongs_to :class
    has_many :Students
end
