class Master < ApplicationRecord
  has_many :availabilities

  validates :name, uniqueness: true
end
