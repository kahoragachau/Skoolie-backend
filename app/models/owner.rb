class Owner < ApplicationRecord
  belongs_to :user, :school
end
