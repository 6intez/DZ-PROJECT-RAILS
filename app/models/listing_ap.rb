class ListingAp < ApplicationRecord
  validates :date, uniqueness: true
end
