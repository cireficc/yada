class CompleteUserSerializer < ActiveModel::Serializer
  root :user
  attributes :id, :username, :name, :birthdate, :country, :city, :ethnicity,
              :relationship_status, :relationship_type, :longest_relationship,
              :height, :body_type, :hair_color, :eye_color, :diet, :smoking,
              :drinking, :drugs, :religion, :religion_importance, :zodiac_sign,
              :education, :education_status, :ambitiousness, :has_children,
              :wants_children, :catch, :summary, :current_life, :free_time,
              :favorite, :most_important, :talk_more, :gender_interest,
              :age_min, :age_max, :desire_single, :desire_near, :ethnicity,
              :relationship_interest, :sexual_genders, :sexual_orientations,
              :pets, :interests
end