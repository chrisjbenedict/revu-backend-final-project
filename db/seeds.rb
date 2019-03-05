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

Category.create(title: "Athletics")
Category.create(title: "Academics")
Category.create(title: "Social Life")
Category.create(title: "Food")
Category.create(title: "Campus")
Category.create(title: "Health Services")
Category.create(title: "Dorms")
Category.create(title: "Greek Life")
Category.create(title: "Events")
Category.create(title: "Location")
Category.create(title: "Off Campus")
Category.create(title: "Transportation")



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


# def hipster_ipsum
#   ["Whatever organic 90's", "drinking", "vinegar", "helvetica", "swag", "synth", "plaid", "YOLO", "raclette", "small", "batch", "VHS","direct","trade","brooklyn", "Taiyaki plaid gastropub venmo", "Chillwave street art taiyaki", "snackwave cardigan church-key tbh offal post-ironic", "+1 bicycle rights microdosing", "Marfa knausgaard narwhal, next level lyft heirloom copper mug pabst tote bag put a bird on it umami vice cred", "Pork belly offal mixtape, edison bulb banjo brunch vegan gochujang", "leggings single-origin coffee", "Single-origin coffee semiotics food truck chia poke", "leggings beard selfies chicharrones small batch", "Crucifix mumblecore blog", "3 wolf moon listicle echo park mixtape celiac", "iPhone typewriter sartorial 8-bit farm-to-table", "Ramps twee cloud bread edison bulb tattooed", "Single-origin coffee iPhone mlkshk twee aesthetic", "mustache craft beer readymade wolf waistcoat la croix 90's taiyaki prism", "VHS synth pop-up prism craft beer yr", "seitan mustache", "8-bit 90's pour-over", "Bicycle rights ugh vegan iPhone 8-bit", "farm-to-table meditation master cleanse etsy", "Etsy shaman coloring book fashion axe", "Church-key artisan authentic lumbersexual tumblr", "Lumbersexual mumblecore fanny pack", "williamsburg hammock activated charcoal vaporware kale chips", "Kogi before they sold out authentic selvage fingerstache", "lo-fi raw denim cliche knausgaard pour-over coloring book", "Schlitz distillery twee listicle crucifix", "Fam 8-bit letterpress", "austin edison bulb roof party vaporware pitchfork post-ironic", "90's edison bulb wayfarers", "occupy four dollar toast thundercats tacos cronut trust fund jianbing direct trade small batch ennui iPhone", "Paleo master cleanse hexagon flexitarian", "subway tile offal vinyl food truck poke etsy health goth hell of pork belly gochujang narwhal", "Photo booth taxidermy mustache forage slow-carb", "Woke activated charcoal quinoa tousled asymmetrical", "cold-pressed actually ugh pickled fanny pack kitsch", "Salvia chia occupy flannel keffiyeh", "Meditation hashtag intelligentsia", "gochujang synth deep v pabst echo park", "PBR&B pork belly chicharrones 8-bit", "Cardigan af williamsburg PBR&B", "Crucifix art party beard fixie", "shoreditch bespoke pabst affogato","slow-carb chia tattooed messenger","bag mumblecore pop-up copper mug", "Vaporware sustainable cray", "enamel pin listicle cred cardigan","pour-over kale chips pok pok trust fund","ugh heirloom", "Chia succulents", "readymade", "bushwick pour-over", "semiotics coloring book", "hot chicken wayfarers intelligentsia", "slow-carb pop-up messenger bag truffaut", "Tacos fixie direct trade organic","farm-to-table ennui roof party disrupt","whatever cloud bread mustache seitan", "gluten-free", "Tumeric meggings bespoke subway tile", "kale chips sartorial pok pok wayfarers", "you probably haven't heard of them", "schlitz forage food truck chambray", "La croix art party next level", "gochujang heirloom", "flexitarian master cleanse"].sample(5).join(",") + "."
# end
#
# def college_ids
#   [1238, 721, 5609, 6743, 804]
# end
#
#
# 100.times do
#   Review.create(user_id: 1, college_id: college_ids.sample, category_id: Category.all.sample.id, content: hipster_ipsum, rating: nil)
# end
