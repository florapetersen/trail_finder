require 'pry' 
module TrailFinder
    class Trail

        @@all = []

        def self.all
            @@all 
        end
        
        def self.load_by_location(latitude, longitude)
            trails_by_location = API.trail_search(latitude, longitude)
            @@all = self.create_from_search(trails_by_location)
        end 

        def self.create_from_search(trails_from_search)
            trails_from_search.collect do |trail_hash|
                self.new(trail_hash) 
            end
        end
        
        attr_accessor :id, :name, :city, :region, :country, :length, :difficulty, :rating, :url, :features, :thumbnail, :description
        
        def initialize(attributes={})
            @name = attributes["name"]
            @id = attributes["id"]
            @city = attributes["city"]
            @region = attributes["region"]
            @country = attributes["country"]
            @length = attributes["length"]
            @difficulty = attributes["difficulty"]
            @rating = attributes["rating"]
            @url = attributes["url"]
            @description = attributes["description"]
            @directions = attributes["directions"]
            @features = attributes["features"]
            @thumbnail = attributes["thumbnail"]
        end 

        def trail_information
            puts [
                "Here is some information about your selected trail!",
                "Name: #{self.name}",
                "ID: #{self.id}",
                "Length: #{self.length}",
                "Difficulty: #{self.difficulty}",
                "Rating: #{self.rating}",
                "Features: #{self.features}",
                "Description: #{self.description}",
                "City: #{self.city}",
                "Region: #{self.region}",
                "County: #{self.country}",
                "Thumbnail: #{self.thumbnail}",
                "URL: #{self.url}"
            ]     
        end
    end
end 