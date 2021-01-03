class CHARACTERS
    @@all = []

    attr_accessor :name, :homeworld, :films, :gender, :birth_year

    def initialize(name, homeworld, films, gender, birth_year)
        @name = name
        @homeworld = homeworld
        @films = films
        @gender = gender
        @birth_year = birth_year
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end
