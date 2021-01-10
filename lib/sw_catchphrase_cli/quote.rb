class QUOTE
    @@all = []
    attr_accessor :id, :starWarsQuote, :faction
    
    def initialize(character_hash)
        character_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    def self.print
        puts self.starWarsQuote
    end
end
