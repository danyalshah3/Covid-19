class Covid19::API

    attr_reader :response

        def initialize
     @response = HTTParty.get("https://covid-api.mmediagroup.fr/v1/cases")
        #   binding.pry
         end

    end