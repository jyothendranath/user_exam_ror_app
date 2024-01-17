class College < ApplicationRecord
  has_many :exams

  validates :college_name, presence: true
end
