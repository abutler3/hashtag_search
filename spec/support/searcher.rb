RSpec.configure do |config|
  config.around do |example|
    cached_searcher = Searcher.searcher
    example.run
    Searcher.searcher = cached_searcher
  end
end

