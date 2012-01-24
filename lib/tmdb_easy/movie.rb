module TmdbEasy  
  class Movie < Base
    def self.search(keyword, lang = "en", response = "json")
      if response == "json"
        method_request = @@api_url + "Movie.search/#{lang}/#{response}/#{@@api_key}/#{keyword}"

        uri = URI.parse(method_request)
        http_response = Net::HTTP.get_response(uri).body
        json_response = JSON.parse(http_response)

      elsif response == "xml"
        method_request = @@api_url + "Movie.search/#{lang}/#{response}/#{@@api_key}/#{keyword}"

        uri = URI.parse(method_request)
        http_response = Net::HTTP.get_response(uri).body
        xml_response = REXML::Document.new(http_response)
        xml_response.elements.to_a("//movie")
      end
    end
  end
end
