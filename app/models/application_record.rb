class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :alpha, -> { order(:name) }
end
