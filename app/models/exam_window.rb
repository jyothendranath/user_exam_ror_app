class ExamWindow < ApplicationRecord
  belongs_to :exam


  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :exam, presence: true
end