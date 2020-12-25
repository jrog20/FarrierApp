class Appointment < ApplicationRecord
  belongs_to :farrier
  belongs_to :horse
end
