class Tech < ApplicationRecord
  has_many :trainings, dependent: :nullify
  has_many :trainer_teches
  has_many :trainers, :through => :trainer_teches

  validates :name, :url, presence: true
end
