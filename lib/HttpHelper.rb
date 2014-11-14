require 'net/https'
require 'uri'
require 'json'

class Connect_Api_Host
	API_HOST = "connect.gettyimages.com"
	API_BASE_URL = "https://#{API_HOST}"
end

class HttpHelper

	def initialize(api_key, access_token)
		@api_key = api_key
		@access_token = access_token
	end	

	def get_uri(path)
		return URI.parse "#{Connect_Api_Host::API_BASE_URL}#{path}"
	end

	def post(endpoint_path, request_body)

		puts request_body
=begin
		uri = get_uri endpoint_path
		request = Net::HTTP::Post.new uri.request_uri

		https = Net::HTTP.new(uri.host, uri.port)
		https.use_ssl = true
		https.verify_mode = OpenSSL::SSL::VERIFY_NONE
		
		response = https.post(uri.path, requestbody.to_json, {'Content-Type' =>'application/json'})

		if !response.is_a?(Net::HTTPSuccess)			
			raise "HTTP RESPONSE: #{response}" 
		end

    	JSON.parse(response.body)
=end

	end	
	
end