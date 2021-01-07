class Horse < ApplicationRecord
  belongs_to :farrier
  has_many :appointments
  belongs_to :owner
  belongs_to :barn

  validates :name, presence: true

  scope :alpha, -> { order(:name) }

  def barn_name=(name)
    self.barn = Barn.find_or_create_by(name: name)
  end

  def barn_name
     self.barn ? self.barn.name : nil
  end

  def owner_name=(name)
    self.owner = Owner.find_or_create_by(name: name)
  end

  def owner_name
     self.owner ? self.owner.name : nil
  end
end
