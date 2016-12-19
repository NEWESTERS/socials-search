class UsersController < ApplicationController
  def profile
  	@history = History.where("owner = '#{current_user.email}'")
  end
end
