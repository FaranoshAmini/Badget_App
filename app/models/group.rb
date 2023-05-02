class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
end
