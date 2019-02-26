class Api::V1::CollegeSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :size, :average_cost, :school_url, :completion_rate, :avg_act, :avg_sat, :admission_rate, :percent_white, :percent_black, :percent_asian, :percent_hispanic, :percent_nhpi, :percent_aian, :percent_women
end

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
