module TrailFinder
    class CLI

        def start
            puts "Welcome to TrailFinder!"
            while @user_input != "exit" 
                set_location
                trail_navigator 
            end
            goodbye 
        end

        def set_location
            puts "To find trails near you, we need the latitude and longitude of your location."
            puts "If you don't know your latitude and longitude, you can search by location here: https://latlong.net."
            puts "Please enter your latitude (degrees north and degrees east should be positive values; degrees south and degrees west should be negative values):"
            latitude = gets.strip
            puts "Please enter your longitude (degrees north and degrees east should be positive values; degrees south and degrees west should be negative values):"
            longitude = gets.strip
            begin
                Trail.load_by_location(latitude, longitude) unless latitude == "exit" || longitude == "exit"
            rescue 
                puts "I don't understand. Try again!"
                set_location
            end 
        end
        
        def trail_navigator 
            list_trails
            ask_for_choice
            while @user_input != "exit" && @user_input != "new location"
                if @user_input == "back"
                    list_trails
                elsif valid?
                    puts Trail.all[@user_input.to_i - 1].trail_information
                else
                    puts "I don't understand. Try again!"
                end
                ask_for_choice
            end
        end
 
        def list_trails
            puts "Here is a list of mountain biking trails near you."
            Trail.all.each.with_index(1) do |trail, index|
               puts "#{index}. #{trail.name}"
            end 
        end
        
        def ask_for_choice
            choices
            @user_input = gets.strip.downcase
        end

        def choices
            puts "To view more information about a trail, enter its number."
            puts "To go back to the list of trails in your location, type 'back'."
            puts "To search trails by a new location, type 'new location'."
            puts "To exit the program, type 'exit'."
        end

        def valid?
            @user_input.to_i.between?(1, Trail.all.length)
        end

        def goodbye
            puts "Happy trails!"
        end
    end
end