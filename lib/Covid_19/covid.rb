class Covid19::Covid

    attr_reader :confirmed, :recovered, :deaths, :country, :population, :continent, :location

    @@all = []

    # puts <<-DOC
    # 1. Afhanistan
    # 2. Pakistan
    # 3. India
    # DOC

    # def self.new_from_list(hash)
    #     binding.pry

    #     # country_1 = self.new
    #     # country_1.confirmed = "45000"
    #     # country_1.recovered = "25000"
    #     # country_1.deaths = "20000"
    #     # country_1.country = "Afghanistan"
    #     # country_1.population = "23000000"
    #     # country_1.continent = "Asia"
    #     # country_1.location = "Southern Asia"
    #     # [country_1]
    # end

    def initialize(hash)
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
    end

    

    def self.find_by_name(name)
        self.all.find{|country| country.country == name}
    end

    

end