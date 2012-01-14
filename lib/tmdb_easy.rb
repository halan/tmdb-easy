require 'net/http'
require 'uri'
require 'json'
require "tmdb_easy/version"

module TmdbEasy
  class Base
    attr_accessor :api_key, :format_response, :language_default

    @@api_url = "http://api.themoviedb.org/2.1/"
  end
  
  class Movie < Base
    def movie_search(keyword, lang = "en", response = "json")
      method_request = @@api_url + "Movie.search/#{lang}/#{response}/#{self.api_key}/#{keyword}"

      uri = URI.parse(method_request)
      response = Net::HTTP.get_response(uri).body
      @json_response = response.to_json
    end
  end
end

