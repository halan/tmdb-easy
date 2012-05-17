require File.join(File.dirname(__FILE__), '..', 'lib', 'tmdb_easy.rb')

describe TmdbEasy::Movie do
  let(:api_key) { 'API_KEY' }

  context 'when I have a api_key' do
    subject           { TmdbEasy::Movie }
    before            { subject.api_key = api_key }

    it 'should request to http://api.themoviedb.org/2.1/Movie.search/ with keyword api_key when search and response' do
      keyword    = 'zoombie'

      Net::HTTP.should_receive(:get_response) do |url|
        url.to_s.should include(keyword)
        url.to_s.should include('http://api.themoviedb.org/2.1/Movie.search/')
        url.to_s.should include(api_key)
      end.and_return(stub(:body => '{"i am": "a zoombie"}'))

      response = subject.search keyword

      response['i am'].should == 'a zoombie'
    end
  end

end
