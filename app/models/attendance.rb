class Attendance < ActiveRecord::Base
  belongs_to :student
  has_one    :cohort, through: :student
  # belongs_to :cohort, through: :students



end


