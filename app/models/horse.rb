class Horse < ApplicationRecord
  belongs_to :farrier
  has_many :appointments
  belongs_to :owner
  belongs_to :barn
  scope :client_flagged, -> { where(flagged: true) }

  accepts_nested_attributes_for :barn
  accepts_nested_attributes_for :owner

  validates :name, presence: true

  def barn_attributes=(attr)
    self.barn = Barn.find_or_create_by(attr) if !attr[:name].blank?
  end

  def owner_attributes=(attr)
    self.owner = Owner.find_or_create_by(attr) if !attr[:name].blank?
  end

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
