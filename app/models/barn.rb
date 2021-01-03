class Barn < ApplicationRecord
  has_many :horses
  has_many :farriers, through: :horses
  has_many :owners, through: :horses
  has_many :appointments, through: :horses
end
