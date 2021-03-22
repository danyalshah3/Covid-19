class Covid19::API

    attr_reader :response

    def initialize
            
        @response = HTTParty.get("https://covid-api.mmediagroup.fr/v1/cases")
        #extracting data using httparty gem and setting is equal to an instance variable response.

    end

end