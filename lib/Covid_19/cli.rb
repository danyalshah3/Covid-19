 class Covid19::CLI 

    def call
        system("clear") #clears terminal
        logo #This loads the ASCII Art data I created to welcome users.
        sleep(0.5)
        get_countries
        menu
     get_country_details
        
 end

 def login

 end


 def get_countries
    puts ""
    puts "Here is the list of affected countries:".colorize(:light_red)
    puts ""
    @lists = Covid19::Covid.all
    @lists.each_with_index do |country, i|
        puts "#{i+1}, #{country.country}".colorize(:green)
        # binding.pry
    end 
 end
def menu
    input = ""
    puts "Which Country you would like to get details about:".colorize(:light_red)
    input = gets.strip

    while input != "exit" 
        country = Covid19::Covid.find_by_name(input)
        c = get_country_details(country)

        puts ""
        puts "Would you like to see details about another country? If yes, type a country name to view its details, type yes to see the list or type exit to leave:"

        input = gets.strip
        if input == "yes"
            get_countries
        elsif input == "exit"
            puts "You are now logged out, see you tomorrow!".colorize(:light_red)
            exit
    
            
        end  
    end
end  




def logo
    puts "Welcome to the data hub of Covid_19 cases:".colorize(:green)
    
end
       

    def get_country_details(country)
        if(country != nil)
        puts "" 
        puts "*******#{country.country} - #{country.continent}*********#{country.location}".colorize(:green)
        puts ""
        puts "Population:        #{country.population}".colorize(:green)
        puts "Confirmed:         #{country.confirmed}".colorize(:green)
        puts "Recovered:         #{country.recovered}".colorize(:green)
        puts "Deaths:            #{country.deaths}".colorize(:green)
        puts "*********************************************"
        else 
            puts "Not sure what you are looking for, type list to see the list of school or type exit.".colorize(:light_red)
        end
    end

end
