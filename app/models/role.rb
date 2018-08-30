class Role < ApplicationRecord
  has_many :staff_role_suitabilities, dependent: :destroy
  has_many :staff, through: :staff_role_suitabilities

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 50 }
  validates :slug, presence: true
end
