 class Covid19::CLI 

    def call
        system("clear") #clears terminal
        logo #This loads the ASCII Art data I created to welcome users.
        sleep(0.5)
        get_countries
        menu
        # get_country_details
        goodbye
 end

#  def login

#  end


 def get_countries
    puts ""
    puts "Here is the list of affected countries:".colorize(:light_red)
    puts ""
    @lists = Covid19::Covid.new_from_list
    @lists.each_with_index do |country, i|
        puts "#{i+1}, #{country.country}".colorize(:green)
        # binding.pry
    end 
 end
def menu
    input = nil
    while input != exit 
        puts "Enter the number of country you want details about:".colorize(:light_red)
        input = gets.strip

 input_number = input.to_i
 if input_number > 0 && input_number <= 1
    get_country_details
 elsif input == "list"
    get_countries
 elsif input == "exit"
    goodbye
else 
    puts "Not sure what you are looking for, type list to see the list of school or type exit.".colorize(:light_red)
        
end
end
end  




def logo
    puts "Welcome to the data hub of Covid_19 cases:".colorize(:green)
    
end
       

def goodbye
    puts "You are now logged out, see you tomorrow!".colorize(:light_red)
    puts"***********************************"
end

def get_country_details
    puts ""
    puts "*******#{country.country} - #{country.continent}*********#{country.location}".colorize(:green)
    puts ""
    puts "Population:        #{country.population}".colorize(:green)
    puts "Confirmed:         #{country.confirmed}".colorize(:green)
    puts "Recovered:         #{country.recovered}".colorize(:green)
    puts "Deaths:            #{country.deaths}".colorize(:green)
    puts "*********************************************"
end

end
