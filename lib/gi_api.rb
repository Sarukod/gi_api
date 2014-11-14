require 'GiApi/version'
require_relative 'Credentials'
require_relative 'HttpHelper'

class GiApi
  
	def initialize(api_key, api_secret, user_name, password)

		@credentials = Credentials.new(
			:api_key => api_key, 
			:api_secret => api_secret,
			:user_name => user_name,
			:password => password)	

 		@endpoint = '/v1/search/SearchForImages'
 		@access_token = @credentials.get_access_token
 		
	end

	def with_phrase(phrase)
		
		@request = {
		        :RequestHeader => { :Token => @access_token},
				:SearchForImages2RequestBody => {
					:Query => { :SearchPhrase => phrase},
					:ResultOptions => {
					:ItemCount => 25,
					:ItemStartNumber => 1 },
					:Filter => { :ImageFamilies => ["creative"] }
					}
				}

		return self
	end

	def execute
		http_helper = HttpHelper.new(@credentials.api_key, @access_token)
		return http_helper.post(@endpoint, @request)			
	end

end
