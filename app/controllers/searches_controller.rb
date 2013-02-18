class SearchesController < ApplicationController
  def create
    redirect_to search_path(params[:twitter][:search])
  end

  def show
	@tweets = Twitter.search("##{params[:id]}").results
  end
end
