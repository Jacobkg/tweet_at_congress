class PetitionsController < ApplicationController

  def new
  end

  def create
    redirect_to links_petitions_path(:text => params[:tweet_text])
  end

  def links
    @long_link = twitter_handles_url(:text => params[:text])
    response = HTTParty.post "https://www.googleapis.com/urlshortener/v1/url",
     :body => {'longUrl' => @long_link}.to_json,
     :headers => { 'Content-Type' => 'application/json' }
    @short_link = response.parsed_response["id"]
  end

end