class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_secure_password

  PASSWORD_REQUIREMENTS = /\A
      (?=.{5,})   # at least 5 characters long
      (?=.*\d)   # contains at least 1 digit
      (?=.*[A-Z])   # contains at least 1 uppercase character
  /x

  validates :password, format: PASSWORD_REQUIREMENTS, allow_nil: true, on: :update
end