class Grade < ApplicationRecord
  has_many :staff, dependent: :nullify

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 30 }
  validates :slug, presence: true
end
