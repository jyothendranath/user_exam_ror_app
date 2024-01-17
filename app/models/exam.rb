class Exam < ApplicationRecord
  belongs_to :college

  has_one :exam_window

  has_many :users
end
