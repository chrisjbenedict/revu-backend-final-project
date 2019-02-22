# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# College.destroy_all

# u1 = User.create(first_name: "Chris", last_name: "Potter", username: "potter@gmail.com")
# u2 = User.create(first_name: "Tony", last_name: "Scrotter", username: "scrotter@gmail.com")
# u3 = User.create(first_name: "Thao", last_name: "Dotter", username: "dotter@gmail.com")
# u4 = User.create(first_name: "Adam", last_name: "Lotter", username: "lotter@gmail.com")
# u5 = User.create(first_name: "Joyce", last_name: "Protter", username: "protter@gmail.com")
# u6 = User.create(first_name: "Isaac", last_name: "Motter", username: "motter@gmail.com")
# u7 = User.create(first_name: "Evans", last_name: "Water", username: "water@gmail.com")
# u8 = User.create(first_name: "Dick", last_name: "Daughter", username: "daughter@gmail.com")

# t.integer :id
# t.string :name
# t.string :city
# t.string :state
# t.integer :size
# t.integer :average_cost
# t.string :school_url
# t.float :completion_rate
# t.integer :avg_act
# t.integer :avg_sat
# t.float :admission_rate
# t.float :percent_white
# t.float :percent_black
# t.float :percent_asian
# t.float :percent_hispanic
# t.float :percent_nhpi
# t.float :percent_aian
# t.float :percent_women


# c1 = College.create(name: "Princeton University", city: "Princeton", state: "NJ", size: 6343, average_cost: 25000, avg_act: 34, avg_sat: 1500, school_url: "www.princeton.edu")
# c2 = College.create(name: "Harvard University", city: "Cambridge", state: "MA", size: 5453, average_cost: 25000, avg_act: 34, avg_sat: 1490, school_url: "www.harvard.edu")
# c3 = College.create(name: "Cornell University", city: "Ithaca", state: "NY", size: 11234, average_cost: 25000, avg_act: 33, avg_sat: 1480, school_url: "www.cornell.edu")
# c4 = College.create(name: "Dartmouth College", city: "Hanover", state: "NH", size: 4567, average_cost: 25000, avg_act: 32, avg_sat: 1470, school_url: "www.dartmouth.edu")
# c5 = College.create(name: "Brown University", city: "Providence", state: "RI", size: 2345, average_cost: 25000, avg_act: 33, avg_sat: 1480, school_url: "www.brown.edu")
# c6 = College.create(name: "Columbia University", city: "New York", state: "NY", size: 7635, average_cost: 25000, avg_act: 33, avg_sat: 1480, school_url: "www.columbia.edu")
# c7 = College.create(name: "Yale University", city: "New Haven", state: "CT", size: 4562, average_cost: 25000, avg_act: 34, avg_sat: 1490, school_url: "www.yale.edu")
# c8 = College.create(name: "University of Pennsylvania", city: "Philadelphia", state: "PA", size: 10454, average_cost: 25000, avg_act: 32, avg_sat: 1460, school_url: "www.upenn.edu")

def allCollegeData
  data = nil
  i = 0
  allData = Array.new
  while i <= 71
    data = JSON.parse(RestClient.get("https://api.data.gov/ed/collegescorecard/v1/schools.json?fields=school.name,latest.student.demographics.female_share,latest.student.size,latest.student.demographics.race_ethnicity.white,latest.student.demographics.race_ethnicity.nhpi,latest.student.demographics.race_ethnicity.aian,latest.student.demographics.race_ethnicity.asian,latest.student.demographics.race_ethnicity.hispanic,latest.student.demographics.race_ethnicity.black,latest.admissions.act_scores.midpoint.cumulative,latest.admissions.sat_scores.average.overall,latest.admissions.admission_rate.overall,latest.completion.completion_rate_4yr_150nt,latest.cost.attendance.academic_year,id,school.city,school.state,school.school_url&_page=#{i}&_per_page=100&api_key=M7Oc5YHxn5DU9i0HUH8ETdfw6OWwBOnk0I8lZh7Q"))
    allData.push(data["results"])
    i += 1
  end
  allColleges = allData.flatten.each do |college|
    College.create(
      college_id: college["id"],
      name: college["school.name"],
      city: college["school.city"],
      state: college["school.state"],
      size: college["latest.student.size"],
      average_cost: college["latest.cost.attendance.academic_year"],
      school_url: college["school.school_url"],
      completion_rate: college["latest.completion.completion_rate_4yr_150nt"],
      avg_act: college["latest.admissions.act_scores.midpoint.cumulative"],
      avg_sat: college["latest.admissions.sat_scores.average.overall"],
      admission_rate: college["latest.admissions.admission_rate.overall"],
      percent_white: college["latest.student.demographics.race_ethnicity.white"],
      percent_black: college["latest.student.demographics.race_ethnicity.black"],
      percent_asian: college["latest.student.demographics.race_ethnicity.asian"],
      percent_hispanic: college["latest.student.demographics.race_ethnicity.hispanic"],
      percent_nhpi: college["latest.student.demographics.race_ethnicity.nhpi"],
      percent_aian: college["latest.student.demographics.race_ethnicity.aian"],
      percent_women: college["latest.student.demographics.female_share"]
    )
  end
end

allCollegeData
