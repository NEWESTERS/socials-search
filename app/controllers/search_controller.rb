require 'json'
require 'addressable/uri'
require "uri"
require 'net/http'

class SearchController < ApplicationController
  def input
  end

  def view
  	@req = params[:str]

    get_link = 'https://www.googleapis.com/customsearch/v1?q=' + @req + '&cx=010204896937700981713:-oz6bxkupgk&key=AIzaSyAmWM5aIFTy4dDJ8xmaVK7SjvtfUjC_r5E'
	  get_link = Addressable::URI.parse(get_link).normalize
   	get_res = Net::HTTP.get(URI.parse(get_link))
    
    @result_array = JSON.parse(get_res)["items"]

    if !current_user.nil?
      new_req = History.new do |req|
        req.owner = current_user.email
        req.request = @req
      end
      new_req.save
    end
  end
end


