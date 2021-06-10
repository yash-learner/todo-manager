class User < ApplicationRecord
  def to_displayable_string
    "#{id}. #{name} #{email} #{first_name} #{last_name}"
  end
end
