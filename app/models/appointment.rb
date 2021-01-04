class Appointment < ApplicationRecord
  belongs_to :farrier
  belongs_to :horse
  belongs_to :barn
  belongs_to :owner

  validates :date, presence: true
end
