class Tech < ApplicationRecord
  validates :name, :url, presence: true
end
