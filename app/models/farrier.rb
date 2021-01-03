class Farrier < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :horses
  has_many :owners, through: :horses
  has_many :barns, through: :horses

  validates :email, :username, :password, presence: true

def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |farrier|
      farrier.username = auth.info.name
      farrier.email = auth.info.email
      farrier.first_name = auth.info.first_name
      farrier.last_name = auth.info.last_name
      farrier.password = SecureRandom.hex
    end
  end
end
