module TmdbEasy
  class Base

    def self.api_key
      @@api_key
    end

    def self.api_key=(api_key)
      @@api_key = api_key
    end

    @@api_url = "http://api.themoviedb.org/2.1/"
  end
end
