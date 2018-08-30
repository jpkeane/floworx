class Staff < ApplicationRecord
  belongs_to :team

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :first_name, presence: true, length: { maximum: 200 }
  validates :last_name, presence: true, length: { maximum: 200 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def slug_candidates
    [
      Staff.email_user(email)
    ]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.email_user(email_address)
    return unless email_address
    email_address.match(/^(.+?)@/)[1]
  end
end
