class Engagement < ApplicationRecord
  belongs_to :project
  belongs_to :role
  belongs_to :staff

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :start_date, presence: true
  validates :end_date, presence: true

  def slug_candidates
    [
      full_code
    ]
  end

  def full_code
    project.full_code + '-' + id.to_s
  end

  def self.engagement_count
    Engagement.count
  end

  def self.staff_assigned
    Engagement.distinct.count(:staff_id)
  end

  def self.bench_count
    Staff.staff_count - Engagement.staff_assigned
  end

  def self.utilisation
    (Engagement.staff_assigned.to_f / Staff.staff_count.to_f) * 100
  end
end
