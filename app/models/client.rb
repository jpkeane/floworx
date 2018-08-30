class Client < ApplicationRecord
  has_many :projects, dependent: :destroy

  extend FriendlyId
  friendly_id :code, use: :slugged

  validates :name, presence: true, length: { maximum: 30 }
  validates :code, presence: true, length: { minimum: 1, maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, length: { minimum: 1, maximum: 3 }, uniqueness: { case_sensitive: false }

  def self.client_count
    Client.count
  end
end
