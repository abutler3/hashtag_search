class Searcher
	attr_reader :results

	def initialize(search_term)
	  @results = Twitter.search(search_term).results
	end
end
