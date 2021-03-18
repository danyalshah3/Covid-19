class Covid19::Covid

    attr_accessor :confirmed, :recovered, :deaths, :country, :population, :continent, :location

    @@all = []

    # puts <<-DOC
    # 1. Afhanistan
    # 2. Pakistan
    # 3. India
    # DOC

    def self.new_from_list

        country_1 = self.new
        country_1.confirmed = "45000"
        country_1.recovered = "25000"
        country_1.deaths = "20000"
        country_1.country = "Afghanistan"
        country_1.population = "23000000"
        country_1.continent = "Asia"
        country_1.location = "Southern Asia"
        [country_1]
    end

    def initialize
        @confirmed = confirmed
        @recovered = recovered
        @deaths = deaths
        @country = country
        @population = population
        @continent = continent
        @location = location
        

    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

end