 class Covid19::CLI 

    def call
        puts "Welcome to the data hub of Covid_19 cases"
        get_countries
        menu
        # get_country_details
        goodbye
 end

 def get_countries
    puts ""
    puts "Here is the list of affected countries:"
    puts ""
    @lists = Covid19::Covid.new_from_list
    @lists.each_with_index do |country, i|
        puts "#{i+1}, #{country.country}"
        # binding.pry
    end 
 end
def menu
    input = nil
    while input != exit 
        puts "Enter the number of country you want details about:"
        input = gets.strip

 input_number = input.to_i
 if input_number > 0 && input_number <= 1
     puts get_country_details
    #   @lists[input.to_i]
 elsif input == "list"
    get_countries
else 
    puts "Not sure what you are looking for, type list to see the list of school or type exit."
        
end
end
end  

def goodbye
    puts "See you tomorrow!"
    puts"***********************************"
end

def get_country_details
    puts ""
    puts "*******#{country.country} - #{country.continent}*********"
    puts ""
    puts "#{country.location}"
    puts ""
    puts "Population:        #{country.population}"
    puts "Confirmed:         #{country.confirmed}"
    puts "Recovered:         #{country.recovered}"
    puts "Deaths:            #{country.deaths}"
    puts "*********************************************"
end

end
