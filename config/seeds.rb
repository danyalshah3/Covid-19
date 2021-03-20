 Covid19::API.new.response.each{|country_hash| Covid19::Covid.new(country_hash)}

#  HTTParty.get("https://covid-api.mmediagroup.fr/v1/cases")
 