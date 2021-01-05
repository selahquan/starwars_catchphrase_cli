class CLI
    #the entryway method
    def run
        puts "Welcome to Star Wars Catchphrase"
        puts "May I have your name young padawan."
        API.get_data
        #binding.pry
        welcome(user_input)
    end

    def welcome(name)
        puts "Greetings #{name}, is there a starwars character you would like to know more about?"
        puts "Type 'y' to see the list, 'n' to leave now."
        logic_gate
    end

    def user_input
        gets.strip
    end

    #menu functions
    def logic_gate

        selection = user_input
        if selection == 'y'
            #show character list
            character_display
            logic_gate
        elsif selection == 'n'
            #show bye message
            goodbye
        else
            error
        end
    end

    def error
        puts "Error! These are not the droids you are looking for, please try again!"
        logic_gate
    end

    def character_display
        #print character list
        Character.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
        end
        character_select
    end
    def character_select
        puts "Select a character for more detail, or type 'next' for more characters"
        selection = user_input
        character = Character.character_info(selection)
        character_details(character)
    end
    def character_details(character)
        puts "Name: #{character.name}"
        puts "Birth Year: #{character.birth_year}"
        puts "Gender: #{character.gender}"
        puts "Homeworld: #{character.homeworld}"
        logic_gate
    end

    def catchphrase

    end
    def goodbye
        puts "Live Long and Prosper. No wait, wrong movie. May the force be with you."
    end
end