class Character
    @@all = []

    attr_accessor :name, :homeworld, :films, :gender, :birth_year

 #   def initialize(name, homeworld, films, gender, birth_year)
 #       @name = name
 #       @homeworld = homeworld
 #       @films = films
 #       @gender = gender
 #       @birth_year = birth_year
 #       save
 #   end

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

    #find and display character details
    def self.character_info(character_name)
        self.all.find do |character|
            character.name
        end
    end
end
