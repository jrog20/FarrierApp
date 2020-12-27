class Horse < ApplicationRecord
  belongs_to :farrier
  has_many :appointments
end
