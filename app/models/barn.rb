class Barn < ApplicationRecord
  has_many :horses, dependent: :destroy
  has_many :farriers, through: :horses
  has_many :owners, through: :horses
  has_many :appointments, through: :horses

  validates :name, presence: true
end
