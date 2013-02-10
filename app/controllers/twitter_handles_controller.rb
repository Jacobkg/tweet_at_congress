class TwitterHandlesController < ApplicationController

  def index
  end

  def create
    api_key = ENV['SUNLIGHT_KEY'] #Set in Heroku config
    url = "http://congress.api.sunlightfoundation.com/legislators/locate?apikey=#{api_key}&zip=#{params[:zip_code]}"
    response = HTTParty.get(url)
    representative_hash = response.parsed_response['results'].select {|n| n["chamber"] == "house"}.first
    twitter_id = representative_hash["twitter_id"]
    name = representative_hash["first_name"] + " " + representative_hash["last_name"]

    redirect_to tweet_twitter_handles_path(:twitter_handle => twitter_id, :name => name)
  end

  def tweet
  end

end