class Role < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 50 }
  validates :slug, presence: true
end
