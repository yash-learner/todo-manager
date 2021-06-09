class UsersController < ApplicationController
  def index
    render plain: User.all.to_a
  end
end
