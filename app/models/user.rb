class User < ApplicationRecord
  belongs_to :exam

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end


