class CLI
    #the entryway method
    def run
        puts "Welcome to Star Wars Catchphrase"
        puts "May I have your name young padawan."
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
        puts "put characters here"
        character_select
    end
    def character_select
        puts "Select a character for more detail"
        selection = user_input
        Character.character_info(selection)
    end
    def catchphrase

    end
    def goodbye
        puts "Live Long and Prosper. No wait, wrong movie. May the force be with you."
    end
end