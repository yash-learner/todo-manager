class User < ApplicationRecord
  def to_displayable_string
    "#{id}. #{first_name} #{last_name} #{email}"
  end
end
