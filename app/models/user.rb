class User < ApplicationRecord
  has_many :todos
  def to_displayable_string
    "#{id}. #{name} #{email} #{first_name} #{last_name}"
  end
end
