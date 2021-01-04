class Horse < ApplicationRecord
  belongs_to :farrier
  has_many :appointments
  belongs_to :owner
  belongs_to :barn

  validates :name, presence: true

  scope :alpha, -> { order(:name) }
end
