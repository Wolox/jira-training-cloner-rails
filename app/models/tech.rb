class Tech < ApplicationRecord
  has_many :trainings, dependent: :nullify

  validates :name, :url, presence: true
end
