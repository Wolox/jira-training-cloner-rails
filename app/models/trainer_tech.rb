class TrainerTech < ApplicationRecord
  belongs_to :trainer
  belongs_to :tech

  validates :active, presence: true
  validates :trainer_to_be, presence: true
end
