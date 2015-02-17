class Producer < ActiveRecord::Base
  has_many :instructors
  has_many :classes

end
