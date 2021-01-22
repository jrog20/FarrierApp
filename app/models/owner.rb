class Owner < ApplicationRecord
  has_many :horses
  has_many :farriers, through: :horses
  has_many :appointments, through: :horses
  has_many :barns, through: :horses

  scope :search, -> (query) { where(name.include? ?, query) }

  # This works for EXACT match:
  # scope :search, -> (query) { where(name: query) }

end
