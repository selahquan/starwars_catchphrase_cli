class API

    def self.get_data
        people_pages = [
            'https://swapi.dev/api/people/',
            'https://swapi.dev/api/people/?page=2', 
            'https://swapi.dev/api/people/?page=3', 
            'https://swapi.dev/api/people/?page=4', 
            'https://swapi.dev/api/people/?page=5', 
            'https://swapi.dev/api/people/?page=6', 
            'https://swapi.dev/api/people/?page=7', 
            'https://swapi.dev/api/people/?page=8', 
            'https://swapi.dev/api/people/?page=9'
        ]
        character_array = []
        
        people_pages.each do |url|
            response = RestClient::Request.execute(
                :url => url, 
                :method => :get, 
                #:headers => headers,
                :verify_ssl => false
              )

             character_array << JSON.parse(response)["results"]
        end
        
        character_array.each do |page|
            page.each do |character|
                Character.new(character)
            end
        
        
        #starwars_quote = RestClient::Request.execute(
        #    :url => 'http://swquotesapi.digitaljedi.dk/api/SWQuote/RandomStarWarsQuote', 
        #    :method => :get, 
            #:headers => headers,
        #    :verify_ssl => true
        #  )
        
        starwars_quote = RestClient.get('http://swquotesapi.digitaljedi.dk/api/SWQuote/RandomStarWarsQuote')
        QUOTE.new(JSON.parse(starwars_quote))
        end
        #binding.pry
        

        #response = RestClient.get('https://swapi.dev/api/people/')
        #character_array = JSON.parse(response)["results"]
        #character_array.each do |character|
        #    Character.new(character)
        #end
        #binding.pry
    end

end 