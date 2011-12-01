module TmdbEasy
  class TmdbMovie < TmdbBase
    def movie_search(lang, response, api_key, keyword)
      url = @@api_url + "Movie.search/"
    end
  end
end
