class UsersController < ApplicationController
  def profile
  	@start = params[:start].to_i
  	history_buf = History.all.select{ |x| x.owner == current_user.email }.reverse
  	@history = history_buf[@start...@start+10]
  	@allow_prev = !(history_buf[@start-10...@start] == [])
  	@allow_next = !history_buf[@start+10...@start+20].nil?
  end
end
