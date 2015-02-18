class Instructor < ActiveRecord::Base
  has_one :class
  has_one :producer
end
