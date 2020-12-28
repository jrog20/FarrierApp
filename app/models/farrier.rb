class Farrier < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :horses, through: :appointments
end
