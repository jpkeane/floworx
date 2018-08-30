class StaffSkillLevel < ApplicationRecord
  belongs_to :staff
  belongs_to :skill

  validates :level, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end
