class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email
      
      t.string :name
      t.datetime :birthday, null: false
      t.string :country
      t.string :city
      t.string :zip_code
      t.string :address
      t.float :latitude
      t.float :longitude
      
      # sexual_gender (taggable)
      # sexual_orientation (taggable)
      t.string :ethnicity, array: true, default: []
      t.integer :relationship_status, null: false
      t.integer :relationship_type
      t.integer :longest_relationship
      t.integer :height
      t.integer :body_type
      t.integer :hair_color
      t.integer :eye_color
      t.integer :diet
      t.integer :smoking
      t.integer :drinking
      t.integer :drugs
      t.integer :religion
      t.integer :religion_importance
      t.integer :zodiac_sign
      t.integer :education
      t.integer :education_status
      t.integer :ambitiousness
      t.boolean :has_children
      t.integer :wants_children
      # pets (taggable)
      
      t.string :catch
      t.text :summary
      # interests (taggable)
      t.text :current_life
      t.text :free_time
      t.text :favorite
      t.text :most_important
      t.text :talk_more
      
      t.integer :gender_interest, null: false
      t.integer :age_min, null: false
      t.integer :age_max, null: false
      t.boolean :desire_single, null: false
      t.boolean :desire_near, null: false
      t.string :relationship_interest, array: true, default: ["new friends"]
      
      t.timestamps
    end
  end
end
