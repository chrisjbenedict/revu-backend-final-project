class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.integer :college_id
      t.string :name
      t.string :city
      t.string :state
      t.integer :size
      t.integer :average_cost
      t.string :school_url
      t.float :completion_rate
      t.integer :avg_act
      t.integer :avg_sat
      t.float :admission_rate
      t.float :percent_white
      t.float :percent_black
      t.float :percent_asian
      t.float :percent_hispanic
      t.float :percent_nhpi
      t.float :percent_aian
      t.float :percent_women


      t.timestamps
    end
  end
end
