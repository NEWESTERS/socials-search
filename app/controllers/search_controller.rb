require 'json'
require 'addressable/uri'
require "uri"
require 'net/http'

class SearchController < ApplicationController
  def input
  end

  def view
    @new = params[:new]
    @start = params[:start]
  	@req = (buf = params[:str]).nil? ? '' : buf
    get_res = get_result_hash(@req, @start)
    db_req = Request.all.find_by(request: @req)
    
    if !get_res.nil?  
      @result_array = result_processing(get_res["items"])
    else
      @result_array = nil
    end

    if @new == 'true'
      if !current_user.nil?
        new_req = History.new do |req|
          req.owner = current_user.email
          req.request = @req
        end
        new_req.save
      end

      if !db_req.nil?
        db_req.update :count => db_req.count + 1
      else
        db_req = Request.new do |req|
          req.request = @req
          req.count = 1
        end
      end
      db_req.save
    end
  end

  def get_result_hash(request, start)
    get_link = 'https://www.googleapis.com/customsearch/v1?q=' + request + '&start=' + start + '&cx=010204896937700981713:-oz6bxkupgk&key=AIzaSyAmWM5aIFTy4dDJ8xmaVK7SjvtfUjC_r5E' 
    get_link = Addressable::URI.parse(get_link).normalize
    JSON.parse(Net::HTTP.get(URI.parse(get_link)))
  end

  def result_processing hashes
    if !hashes.nil?
      hashes.map do |hash|
        result = { :link => hash["link"], :title => hash["title"], :img => "", :site => 'https://' + hash["displayLink"] }
        if hash["displayLink"].include? "vk"
          result[:img] = "https://pp.vk.me/c543104/v543104095/1783c/cOtdLh_Fw6w.jpg"
        elsif hash["displayLink"].include? "youtube"
          result[:img] = "https://www.youtube.com/yt/brand/media/image/YouTube-icon-full_color.png"
        elsif hash["displayLink"].include? "twitter"
          result[:img] = "https://pbs.twimg.com/profile_images/767879603977191425/29zfZY6I.jpg"
        elsif hash["displayLink"].include? "facebook"
          result[:img] = "https://facebookbrand.com/wp-content/themes/fb-branding/prj-fb-branding/assets/images/fb-art.png"
        else
          result[:img] = "http://kingofwallpapers.com/x/x-001.jpg"
        end
        result
      end
    else
      nil
    end
  end
end


