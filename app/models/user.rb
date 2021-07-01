class User < ApplicationRecord
  validates :first_name, :email, :password, presence: true
  validates :first_name, length: { minimum: 3 }
  validate :password_requirements

  has_secure_password
  has_many :todos

  def password_requirements
    rules = {
      "is too short (minimum is 8 characters)"      => /[a-zA-Z0-9]|[A-Za-z0-9]|[0-9a-zA-Z]{8,}$/,
      "must contain at least one lowercase letter"  => /[a-z]+/,
      "must contain at least one uppercase letter"  => /[A-Z]+/,
      "must contain at least one digit"             => /\d+/,
      "must contain at least one special character" => /[^A-Za-z0-9]+/
    }
    rules.each do |message, regex|
      errors.add( :password, message ) unless password&.match( regex )
    end
  end

end
