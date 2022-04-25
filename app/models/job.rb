class Job < ApplicationRecord
  # Association
  has_many :employees, dependent: nil
  has_many :suppliers, dependent: nil

  # Validation
  validates :job_title, :job_desc, :start_date, presence: true
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }, allow_blank: true
end
