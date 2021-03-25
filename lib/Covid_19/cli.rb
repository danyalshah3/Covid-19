 class Covid19::CLI 

    def call
        @prompt = TTY::Prompt.new
        system("clear") #clears terminal
        @name = @prompt.ask("Whats your name?")
        puts "Hi!, #{@name}"
        logo 
        sleep(0.5)
        get_countries 
        menu 
        get_country_details    
    end


    def get_countries
        puts ""
        puts "Gathering information"
        sleep(1)
        puts "Accessing Databases"
        sleep(1)
        puts "Loading Data"
        sleep(2)
        puts ""
        puts "Here is the list of affected countries:".colorize(:light_red)
        sleep (1)

        @lists = Covid19::Covid.all 
        @lists.each_with_index do |country, i|
            puts "#{i+1}, #{country.country}".colorize(:green)
            #it sets class method covid.all equal to an istance variable @lists and than take than isntance and iterates over it, 
            #using country and index and puts out the data from the country object.
        end 
    end

    def menu
        input = ""
        puts "Hi! #{@name}, which Country you would like to get details about:".colorize(:light_red)
        input = gets.strip

        while input != "nil" 
            country = Covid19::Covid.find_by_name(input) #it finds the input(country) by name
             get_country_details(country) #it takes in the argument country and gets the details of the country.
            puts ""
             puts "Hey #{@name}, would you like to see details about another country?, please type yes to start over or exit/no to exit the app".colorize(:light_red)
            input = gets.strip
            if input == "yes"
             menu
            elsif input == "exit" || input == "no"
              puts "Goodbye #{@name}, see you tomorrow!".colorize(:light_red)
              exit 
                
            end  
        end
    end 


    def logo
        puts "Welcome to the data hub of Covid 19 cases:".colorize(:green)
        
    end
        

    def get_country_details(country)
        sleep(1)
        if(country != nil) #if input is valid its prints out the details otherwise puts out the below statement.
            puts <<-DOC
                
            1. "#{country.country} >> (#{country.continent} - #{country.location})"
            
            2. "Population of this country is:                              #{country.population}"
            3. "Number of confirmed cases from the respective country is:   #{country.confirmed}"
            4. "Number of Recovered:                                        #{country.recovered}"
            5. "Number of Deaths:                                           #{country.deaths}"
             "*********************************************"
            DOC
    
        else
            puts "Not sure what country that you are looking for;".colorize(:light_red)
        end
    end

end
