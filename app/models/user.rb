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
  
  VALID_AGE_RANGE = 18..99
  VALID_AGE_RANGE_MESSAGE = "must be between 18 and 99"
  
  validates :height, inclusion: { in: 50..300, message: "must be between 50 and 300 centimeters" }
  validates :age_min, inclusion: { in: VALID_AGE_RANGE, message: VALID_AGE_RANGE_MESSAGE }
  validates :age_max, inclusion: { in: VALID_AGE_RANGE, message: VALID_AGE_RANGE_MESSAGE }
	
	private
	
	def at_least_18
	  self.errors.add(:birthdate, "must be 18 years or older") if (self.birthdate && 18.years.ago.to_date < self.birthdate)
	end
	
	has_secure_password
end
