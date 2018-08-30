class StaffRoleSuitability < ApplicationRecord
  belongs_to :staff
  belongs_to :role

  validates :suitability, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end
