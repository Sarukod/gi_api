require 'open-uri'
require 'net/http'
require 'net/https'
require 'json'

class Credentials
	attr_accessor :api_key, :api_secret, :user_name, :password

	def initialize(args)
		@endpoint = "https://connect.gettyimages.com/v1/session/CreateSession"
		args.keys.each { |name| instance_variable_set "@" + name.to_s, args[name] }	
	end

	def get_access_token

		request = {
				:RequestHeader =>
				{
					:Token => ""
				},
				:CreateSessionRequestBody =>
				{
					:SystemId => @api_key,
					:SystemPassword => @api_secret,
					:UserName => @user_name,
					:UserPassword => @password
				}
			}

		post_json(request)

	end

	def post_json(request)

	    uri = URI.parse(@endpoint)
	    http = Net::HTTP.new(uri.host, 443)
	    http.use_ssl = true
	    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

	    response = http.post(uri.path, request.to_json, {'Content-Type' =>'application/json'}).body
		JSON.parse(response)["CreateSessionResult"]["Token"]
		
  	end

end