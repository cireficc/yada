class User < ApplicationRecord
  
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
  
  VALID_AGE_RANGE = 18..99
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
