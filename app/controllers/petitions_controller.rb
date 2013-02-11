class PetitionsController < ApplicationController

  def new
  end

  def create
    redirect_to links_petitions_path(:text => params[:tweet_text])
  end

  def links
  end

end