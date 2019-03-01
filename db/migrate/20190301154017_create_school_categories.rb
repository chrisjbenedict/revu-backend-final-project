class CreateSchoolCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :school_categories do |t|
      t.integer :school_id
      t.integer :category_id

      t.timestamps
    end
  end
end
