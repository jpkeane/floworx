class Project < ApplicationRecord
  belongs_to :client

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true, length: { maximum: 30 }
  validates :code, presence: true, length: { minimum: 1, maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, length: { minimum: 3, maximum: 7 }, uniqueness: { case_sensitive: false }

  def slug_candidates
    [
      full_code
    ]
  end

  def full_code
    client.code + '-' + code
  end
end
