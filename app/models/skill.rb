class Skill < ApplicationRecord
  has_many :staff_skill_levels, dependent: :destroy
  has_many :staff, through: :staff_skill_levels

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 50 }
  validates :slug, presence: true
end
