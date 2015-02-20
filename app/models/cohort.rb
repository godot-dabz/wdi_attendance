class Cohort < ActiveRecord::Base
  has_many   :instructors
  has_many   :students
  belongs_to :producer


  def self.create_cohort_records
  	cohort_url = "http://104.131.73.180/api/v1/cohorts"
    cohorts = HTTParty.get(cohort_url)
    @cohorts = cohorts["cohorts"].map do |cohort|
    	cohort = Cohort.new(name: cohorts["name"],
    		instructor: cohorts["instructor_ids"])
    end
   end

end

