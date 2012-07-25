module TmdbEasy  
  class Movie < Base
    def self.search(keyword, lang = :en, response_type = :json)
      raise ArgumentError.new 'invalid lang' unless all_langs.include? lang.to_sym

      request keyword, lang, response_type do |response|
        case response_type.to_sym
          when :json  then response_with_json response
          when :xml   then response_with_xml  response
          else raise ArgumentError.new 'response should be :json or :xml'
        end
      end
    end

    protected
    def self.all_langs
      [:en, :pt, :es]
    end

    def self.response_with_xml response
      REXML::Document.new(response).elements.to_a("//movie")
    end

    def self.response_with_json response
      JSON.parse(response)
    end

    def self.request keyword, lang, response_type
      uri = URI.parse "#{@@api_url}Movie.search/#{lang}/#{response_type}/#{@@api_key}/#{keyword}"
      yield Net::HTTP.get_response(uri).body 
    end
  end
end
