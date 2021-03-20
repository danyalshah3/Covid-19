 class Covid19::CLI 

    def call
        system("clear") #clears terminal
        logo #This loads the ASCII Art data I created to welcome users.
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
        puts "Making it look nice!"
        sleep(2)
        puts ""
        puts "Here is the list of affected countries:".colorize(:light_red)
        sleep (1)

        @lists = Covid19::Covid.all
        @lists.each_with_index do |country, i|
            puts "#{i+1}, #{country.country}".colorize(:green)
            
        end 
    end

    def menu
        input = ""
        puts "Which Country you would like to get details about:".colorize(:light_red)
        input = gets.strip

        while input != "exit" 
            country = Covid19::Covid.find_by_name(input)
             get_country_details(country)

            puts ""
            puts "Would you like to see details about another country? Type yes to start over or type exit to leave:".colorize(:light_red)

            input = gets.strip
            if input == "yes"
             menu
            elsif input == "exit"
             puts "You are now logged out, see you tomorrow!".colorize(:light_red)
             exit
            else     
        
                
             end  
        end
    end  




    def logo
        puts "Welcome to the data hub of Covid_19 cases:".colorize(:green)
        
    end
        

    def get_country_details(country)
        sleep(1)
        if(country != nil) 
            puts <<-DOC
                
            1. "#{country.country} - #{country.continent} - #{country.location}"
            
            2. "Population:        #{country.population}"
            3. "Confirmed:         #{country.confirmed}"
            4. "Recovered:         #{country.recovered}"
            5. "Deaths:            #{country.deaths}"
             "*********************************************"
            DOC
    
        else
            puts "Not sure what country that you are looking for;".colorize(:light_red)
        end
    end

end
