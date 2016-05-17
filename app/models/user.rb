# @restful_api 1.0
#
# ### Enums
#
# `enum relationship_status: [:single, :seeing_someone, :married, :open_relationship]`
#
# `enum relationship_type: [:monogamous, :polygamous]`
#
# `enum longest_relationship: [:six_months, :one_year, :two_years, :three_years, :four_years, :five_years, :more_than_five_years]`
#
# `enum body_type: [:rather_not_say, :thin, :average_build, :a_little_extra, :curvy, :full_figured, :fit, :jacked]`
#
# `enum hair_color: [:black, :brown, :blond, :auburn, :chestnut, :red, :gray, :white, :dyed, :bald]`
#
# `enum eye_color: [:amber, :blue, :brown, :gray, :green, :hazel, :other]`
#
# `enum diet: [:omnivore, :vegetarian, :vegan, :kosher, :halal]`
#
# `enum smoking: [:no, :sometimes, :often]`
#
# `enum drinking: [:no, :socially, :often]`
#
# `enum drugs: [:no, :sometimes, :often]`
#
# `enum religion: [:agnosticism, :atheism, :buddhism, :catholicism, :christianity, :hinduism, :islam, :judaism, :sikh, :other]`
#
# `enum religion_importance: [:not_important, :somewhat_important, :important]`
#
# `enum zodiac_sign: [:aquarius, :pisces, :aries, :taurus, :gemini, :cancer, :leo, :virgo, :libra, :scorpio, :sagittarius, :capricorn]`
#
# `enum education: [:high_school, :two_year_college, :vocational_school, :bachelor, :master, :doctorate, :other]`
#
# `enum education_status: [:dropped_out, :working_on, :completed]`
#
# `enum ambitiousness: [:not_ambitious, :somewhat_ambitious, :ambitious, :very_ambitious]`
#
# `enum wants_children: [:maybe_want, :want, :does_not_want]`
#
# `enum gender_interest: [:men, :women, :everyone]`
#
# @property [Integer] id The id of the user
# @property [String] username The username of the user
# @property [String] email The email of the user
# @property [String] name The name of the user
# @property [Date] birthdate When the user was born
# @property [String] country The country of the user
# @property [String] city The city of the user
# @property [String] zip_code The zip code of the user
# @property [String] address The address of the user
# @property [Float] latitude The latitude of the user
# @property [Float] longitude The longitude of the user
# @property [String[]] ethnicity The ethnicity of the user
# @property [Integer] relationship_status The relationship status of the user
# @property [Integer] relationship_type The relationship type of the user
# @property [Integer] longest_relationship The longest relationship of the user
# @property [Integer] height The height of the user
# @property [Integer] body_type The body type of the user
# @property [Integer] hair_color The hair color of the user
# @property [Integer] eye_color The eye color of the user
# @property [Integer] diet The diet of the user
# @property [Integer] smoking How often the user smokes
# @property [Integer] drinking How often the user drinks
# @property [Integer] drugs How often the user does drugs
# @property [Integer] religion The religion of the user
# @property [Integer] religion_importance How important the user's religion is to them
# @property [Integer] zodiac_sign The zodiac sign of the user
# @property [Integer] education The level of education of the user
# @property [Integer] education_status The education status of the user
# @property [Integer] ambitiousness How ambitious the user is
# @property [Boolean] has_children The has children of the user
# @property [Integer] wants_children The user's desire to have children
# @property [String] catch The user's short phrase to catch a potential matche's attention
# @property [String] summary The summary of the user
# @property [String] current_life What the user is doing currently in their life
# @property [String] free_time What the user does in their free time
# @property [String] favorite The favorite things of the user
# @property [String] most_important The most important things to the user
# @property [String] talk_more A potential match should message the user if
# @property [Integer] gender_interest The genders that the user is interested in
# @property [Integer] age_min The minimum age the user wants to match with
# @property [Integer] age_max The maximum age the user wants to match with
# @property [Boolean] desire_single Whether or not the user desires matches that are single
# @property [Boolean] desire_near Whether or not the user desires matches near to them
# @property [String[]] relationship_interest The user's relationship interests
# @property [Date] create_at When the user was created
# @property [Date] updated_at When the user was last updated
#
# @example
#  ```json
#   { "id": 1,
#     "username": "chriscirefice",
#     "email": "email@domain.com",
#     "name": "chris",
#     "birthdate": "1992-10-12T00:00:00.000Z",
#     "country": null,
#     "city": null,
#     "zip_code": null,
#     "address": null,
#     "latitude": null,
#     "longitude": null,
#     "ethnicity": ["white"],
#     "relationship_status": "single",
#     "relationship_type": "monogamous",
#     "longest_relationship": "one_year",
#     "height": 168,
#     "body_type": "average_build",
#     "hair_color": "brown",
#     "eye_color": "brown",
#     "diet": "omnivore",
#     "smoking": "no",
#     "drinking": "socially",
#     "drugs": "no",
#     "religion": "atheism",
#     "religion_importance": "not_important",
#     "zodiac_sign": "libra",
#     "education": "bachelor",
#     "education_status": "working_on",
#     "ambitiousness": "very_ambitious",
#     "has_children": false,
#     "wants_children": "want",
#     "catch": "Chris is a cool guy!",
#     "summary": "A summary",
#     "current_life": "What I'm doing with my life",
#     "free_time": "What I do in my free time",
#     "favorite": "My favorite things",
#     "most_important": "Things that are most important to me",
#     "talk_more": "We should talk if...",
#     "gender_interest": "women",
#     "age_min": 18,
#     "age_max": 32,
#     "desire_single": true,
#     "desire_near": false,
#     "relationship_interest": ["new friends","long-term dating"],
#     "created_at": "2016-05-13T06:37:30.428Z",
#     "updated_at": "2016-05-13T06:37:30.428Z"
#   }
#  ```
class User < ApplicationRecord

  acts_as_taggable
  acts_as_taggable_on :sexual_genders, :sexual_orientations, :pets, :interests
  
  # Reserved usernames that cannot be chosen by users
  RESERVED = %w{
    achievements
    admin
    administrator
    api
    contact_us
    emails
    faq
    privacy_policy
    root
    superuser
    teams
    tos
    usernames
    users
  }
  
  validates_presence_of :username, :birthdate
  
  # 1 to 25 characters, alphanumeric, underscores allowed
  VALID_USERNAME = /\A[a-zA-Z0-9_]{1,25}\z/
  
  validates :username,
            exclusion: {in: RESERVED, message: "is reserved"},
            format: {with: VALID_USERNAME, message: "must be alphanumeric; it can also contain underscores"},
            uniqueness: true,
            if: :username_changed?
  
  validate :at_least_18

  enum relationship_status: {
    single: 0,
    seeing_someone: 1,
    married: 2,
    open_relationship: 3
  }
  
  enum relationship_type: {
    monogamous: 0,
    polygamous: 1
  }
  
  enum longest_relationship: {
    six_months: 0,
    one_year: 1,
    two_years: 2,
    three_years: 3,
    four_years: 4,
    five_years: 5,
    more_than_five_years: 6
  }
  
  validates :height, inclusion: { in: 50..300, message: "must be between 50 and 300 centimeters" }
  
  # The age range that is valid for users
  VALID_AGE_RANGE = 18..99
  # The message for when the age range is invalid
  VALID_AGE_RANGE_MESSAGE = "must be between 18 and 99"
  
  validates :age_min, inclusion: { in: VALID_AGE_RANGE, message: VALID_AGE_RANGE_MESSAGE }
  validates :age_max, inclusion: { in: VALID_AGE_RANGE, message: VALID_AGE_RANGE_MESSAGE }
  
  enum body_type: {
    rather_not_say: 0,
    thin: 0,
    average_build: 1,
    a_little_extra: 2,
    curvy: 3,
    full_figured: 4,
    fit: 5,
    jacked: 6
  }
  
  enum hair_color: {
    black: 0,
    brown: 1,
    blond: 2,
    auburn: 3,
    chestnut: 4,
    red: 5,
    gray: 6,
    white: 7,
    dyed: 8,
    bald: 9
  }, _prefix: true
  
  enum eye_color: {
    amber: 0,
    blue: 1,
    brown: 2,
    gray: 3,
    green: 4,
    hazel: 5,
    other: 6
  }, _prefix: true
  
  enum diet: {
    omnivore: 0,
    vegetarian: 1,
    vegan: 2,
    kosher: 3,
    halal: 4
  }
  
  enum smoking: {
    no: 0,
    sometimes: 1,
    often: 2
  }, _prefix: true
  
  enum drinking: {
    no: 0,
    socially: 1,
    often: 2
  }, _prefix: true
  
  enum drugs: {
    no: 0,
    sometimes: 1,
    often: 2
  }, _prefix: true
  
  enum religion: {
    agnosticism: 0,
    atheism: 1,
    buddhism: 2,
    catholicism: 3,
    christianity: 4,
    hinduism: 5,
    islam: 6,
    judaism: 7,
    sikh: 8,
    other: 9
  }, _prefix: true
  
  enum religion_importance: {
    not_important: 0,
    somewhat_important: 1,
    important: 2
  }
  
  enum zodiac_sign: {
    aquarius: 0,
    pisces: 1,
    aries: 2,
    taurus: 3,
    gemini: 4,
    cancer: 5,
    leo: 6,
    virgo: 7,
    libra: 8,
    scorpio: 9,
    sagittarius: 10,
    capricorn: 11
  }
  
  enum education: {
    high_school: 0,
    two_year_college: 1,
    vocational_school: 2,
    bachelor: 3,
    master: 4,
    doctorate: 5,
    other: 6
  }, _prefix: true
  
  enum education_status: {
    dropped_out: 0,
    working_on: 1,
    completed: 2
  }
  
  enum ambitiousness: {
    not_ambitious: 0,
    somewhat_ambitious: 1,
    ambitious: 2,
    very_ambitious: 3
  }
  
  enum wants_children: {
    maybe_want: 0,
    want: 1,
    does_not_want: 2
  }
  
  enum gender_interest: {
    men: 0,
    women: 1,
    everyone: 2
  }
  
  has_secure_password
	
	private
	
	def at_least_18
	  self.errors.add(:birthdate, "must be 18 years or older") if (self.birthdate && 18.years.ago.to_date < self.birthdate)
	end
end
