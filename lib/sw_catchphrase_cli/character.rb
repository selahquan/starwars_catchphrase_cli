class Character
    @@all = []

    attr_accessor :name, :homeworld, :films, :gender, :birth_year

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

    def self.character_info(character_name)
        self.all.find do |character|
            character.name == character_name
        end
    end
end
