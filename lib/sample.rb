require_relative 'gi_api'

class Getty

	@api_key = ''
  	@api_secret = '' 
  	@username = ''
  	@password = ''

	def self.search_videos(phrase)
		GiApi.new(@api_key, @api_secret, @username, @password)
			.with_phrase(phrase).execute()
	end

end 

puts Getty::search_videos('gorilla')