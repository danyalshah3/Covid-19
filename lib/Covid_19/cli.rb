 class Covid19::CLI 

    def call
        system("clear") #clears terminal
        logo #calls instance method logo
        sleep(0.5)
        get_countries #calls instance method get_countries
        menu #calls instance method menu
        get_country_details    #calls instance method get_country_details
    end

# def user_login
#     username 
#     @user = Covid19::User.find_by_username_or_create(username)
# end

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
            #it sets class method covid.all equal to an istance variable @lists and than take than isntance and iterates over it, 
            #using country and index and puts out the country object.
        end 
    end

    def menu
        input = ""
        puts "Which Country you would like to get details about:".colorize(:light_red)
        input = gets.strip

        while input != "exit" 
            country = Covid19::Covid.find_by_name(input) #it finds the input(country) by name
             get_country_details(country) #it takes in the argument country and gets the details of the country.

            puts ""
            puts "Would you like to see details about another country? Type yes to start over or type exit to leave:".colorize(:light_red)

            input = gets.strip
            if input == "yes"
             menu
            elsif input == "exit"
              puts "You are now logged out, see you tomorrow!".colorize(:light_red)
            #   logout
              exit #exits the app
            else     
        
                
             end  
        end
    end  

    # def logout
    #     @user = nil
    #     menu
    # end




    def logo
        puts "Welcome to the data hub of Covid_19 cases:".colorize(:green)
        
    end
        

    def get_country_details(country)
        sleep(1)
        if(country != nil) #if input is valid its prints out the details otherwise puts out the below statement.
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
