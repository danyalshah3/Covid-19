class Covid19::Covid

    attr_reader :confirmed, :recovered, :deaths, :country, :population, :continent, :location

    @@all = []
    
    def initialize(hash) 
        #initialize a nested hash
        @confirmed = hash[1]['All']['confirmed']
        @recovered = hash[1]['All']['recovered']
        @deaths = hash[1]['All']['deaths']
        @country = hash[0]
        @population = hash[1]['All']['population']
        @continent =  hash[1]['All']['continent']
        @location =  hash[1]['All']['location']
        
        @@all << self
    end

    def self.all
        @@all
        #return all instances of Covid
    end

    

    def self.find_by_name(name)
        self.all.find{|country| country.country == name}
        #find_by_name method is being called on the Covid class, it takes in the name and output the country(object) with the name.
    end

    

end