FactoryGirl.define do
  factory :chris, class: User do
    username "chriscirefice"
    password_digest BCrypt::Password.create('chris', cost: 4)
    email "email@domain.com"
    name "chris"
    birthdate "1992-10-12 00:00:00"
    ethnicity ["white"]
    relationship_status 0
    relationship_type 0
    longest_relationship 1
    height 168
    body_type 1
    hair_color 2
    eye_color 2
    diet 0
    smoking 0
    drinking 1
    drugs 0
    religion 3
    religion_importance 0
    education 4
    education_status 0
    ambitiousness 3
    has_children false
    wants_children 1
    catch "Chris is a cool guy!"
    summary "A summary"
    current_life "What I'm doing with my life"
    free_time "What I do in my free time"
    favorite "My favorite things"
    most_important "Things that are most important to me"
    talk_more "We should talk if..."
    gender_interest 0
    age_min 18
    age_max 32
    desire_single true
    desire_near false
    relationship_interest ["new friends", "long-term dating"]
  end

  factory :amy, class: User do
    username "amykun"
    password_digest BCrypt::Password.create('amy', cost: 4)
    email "amy@domain.com"
    name "Amy"
    birthdate "1990-7-4T00:00:00.000Z"
    ethnicity ["white", "asian"]
    relationship_status 0
    relationship_type 0
    longest_relationship 0
    height 155
    body_type 1
    hair_color 2
    eye_color 2
    diet 1
    smoking 2
    drinking 1
    drugs 2
    religion 0
    religion_importance 0
    zodiac_sign 1
    education 0
    education_status 0
    ambitiousness 2
    has_children false
    wants_children 2
    catch "I'm not as cool as Chris"
    summary "Nothing special about me"
    current_life "Forever alone"
    free_time "I don't have free time"
    favorite "Favorite all the things"
    most_important "Everything is important"
    talk_more "Just message me you panzee"
    gender_interest 1
    age_min 22
    age_max 25
    desire_single true
    desire_near true
    relationship_interest ["new friends", "casual sex"]
  end
end