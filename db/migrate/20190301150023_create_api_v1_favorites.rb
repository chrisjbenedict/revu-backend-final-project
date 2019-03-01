class CreateApiV1Favorites < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_favorites do |t|
      t.integer :user_id
      t.integer :college_id
      t.integer :ranking
      t.boolean :app_started
      t.boolean :essay
      t.boolean :app_submitted

      t.timestamps
    end
  end
end
