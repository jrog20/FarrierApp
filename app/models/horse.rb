class Horse < ApplicationRecord
  has_many :farriers, through: :appointments
  has_many :appointments
end
