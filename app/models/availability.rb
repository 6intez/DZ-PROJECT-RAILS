class Availability < ApplicationRecord
  belongs_to :master
  validates :date, uniqueness: { scope: :master_id}

end
