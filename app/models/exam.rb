class Exam < ApplicationRecord
  belongs_to :college

  has_one :exam_window

  has_many :users


  validates :exam_name, presence: true

  validates :college, presence: true
end
