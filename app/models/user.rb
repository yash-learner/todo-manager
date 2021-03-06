class User < ApplicationRecord
  validates :first_name, :email, :password, presence: true
  validates :first_name, length: { minimum: 3 }
  validate :password_requirements
  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :todos

  def password_requirements
    rules = {
      "is too short (minimum is 8 characters)" => /(?=.*\d)(?=.*[^A-Za-z0-9])(?=.*[a-z])(?=.*[A-Z]).{8,}/,
      "must contain at least one lowercase letter" => /[a-z]+/,
      "must contain at least one uppercase letter" => /[A-Z]+/,
      "must contain at least one digit" => /\d+/,
      "must contain at least one special character" => /[^A-Za-z0-9]+/,
    }

    rules.each do |message, regex|
      errors.add(:password, message) unless password&.match(regex)
    end
  end
end
