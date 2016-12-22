class UsersController < ApplicationController
  def profile
  	@history = History.all.select{ |x| x.owner == current_user.email }.reverse
  end
end
