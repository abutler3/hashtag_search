class SearchesController < ApplicationController
  def create
    redirect_to search_path(params[:twitter][:search])
  end

  def show
	@tweets = Searcher.new("##{params[:id]}").results
  end
end
