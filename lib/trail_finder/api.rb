require "bundler/setup"
require "pry"
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

module TrailFinder
    class API
    
        def self.trail_search(latitude, longitude)
            url = URI("https://trailapi-trailapi.p.rapidapi.com/trails/explore/?lat=#{latitude}&lon=#{longitude}")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-host"] = 'trailapi-trailapi.p.rapidapi.com'
            request["x-rapidapi-key"] = 'c52903773amsh6a0480aaf62e678p1db00fjsnc8af0d603a0b'

            response = http.request(request) 
            JSON.parse(response.read_body)["data"]
        end
    end
end