class Trainer < ApplicationRecord
  validates :name, :email, presence: true
end
