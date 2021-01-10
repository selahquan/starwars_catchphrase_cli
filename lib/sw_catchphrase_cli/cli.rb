class CLI
    #the entryway method
    def run
        sw_logo
        puts "Welcome to Star Wars Catchphrase"
        puts "May I have your name young padawan."
        API.get_data
        #binding.pry
        welcome(user_input)
    end
    def sw_logo 
        puts <<-'HEREDOC'
           .           .        .                     .        .            .
                   .               .    .          .              .   .         .
                     _________________      ____         __________
       .       .    /                 |    /    \    .  |          \
           .       /    ______   _____| . /      \      |    ___    |     .     .
                   \    \    |   |       /   /\   \     |   |___>   |
                 .  \    \   |   |      /   /__\   \  . |         _/             .
       .     ________>    |  |   | .   /            \   |   |\    \_______    .
            |            /   |   |    /    ______    \  |   | \           |
            |___________/    |___|   /____/      \____\ |___|  \__________|    .
        .     ____    __  . _____   ____      .  __________   .  _________
             \    \  /  \  /    /  /    \       |          \    /         |      .
              \    \/    \/    /  /      \      |    ___    |  /    ______|  .
               \              /  /   /\   \ .   |   |___>   |  \    \
         .      \            /  /   /__\   \    |         _/.   \    \
                 \    /\    /  /            \   |   |\    \______>    |   .
                  \  /  \  /  /    ______    \  |   | \              /          .
       .       .   \/    \/  /____/      \____\ |___|  \____________/  
                                     .
                                                 .               .
        HEREDOC
      end
    def welcome(name)
        puts "Greetings #{name}, is there a starwars character you would like to know more about?"
        puts "Type 'y' to see the list, 'n' to leave now. Type exit to leave at anytime."
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
        elsif selection == 'exit'
            goodbye
        else
            error
            logic_gate
        end
    end
    
    def goodbye
        puts "Live Long and Prosper. No wait, wrong movie. May the force be with you."
        puts <<-'HEREDOC'
                       .-.
                      |_:_|
                     /(_Y_)\
.                   ( \/M\/ )
 '.               _.'-/'-'\-'._
   ':           _/.--'[[[[]'--.\_
     ':        /_'  : |::"| :  '.\
       ':     //   ./ |oUU| \.'  :\
         ':  _:'..' \_|___|_/ :   :|
           ':.  .'  |_[___]_|  :.':\
            [::\ |  :  | |  :   ; : \
             '-'   \/'.| |.' \  .;.' |
             |\_    \  '-'   :       |
             |  \    \ .:    :   |   |
             |   \    | '.   :    \  |
             /       \   :. .;       |
            /     |   |  :__/     :  \\
           |  |   |    \:   | \   |   ||
          /    \  : :  |:   /  |__|   /|
          |     : : :_/_|  /'._\  '--|_\
          /___.-/_|-'   \  \
                         '-'"
                         
        HEREDOC
    end

    def error
        puts "Error! These are not the droids you are looking for, please try again!"
    end

    def character_display
        #print character list
        Character.all.each.with_index(1) do |character, i|
            puts "#{i}. #{character.name}"
        end
        character_select
    end
    def character_select
        puts "Select a character by entering their number or typing their name for more detail."
        selection = user_input
        #character = Character.character_info(selection)

        if selection.to_i.between?(1, Character.all.length + 1)
            character =  Character.all[selection.to_i - 1]
        elsif Character.character_info(selection) != nil
        character = Character.character_info(selection)
        elsif selection == "exit"
            goodbye           
        else
            error
            character_select
        end
        character_details(character)
    end
    def character_details(character)
        puts "Name: #{character.name}"
        puts "Birth Year: #{character.birth_year}"
        puts "Gender: #{character.gender}"
        puts catchphrase
        puts "Would you like to see another character? Enter 'y' to see the list or 'n' to exit."
        logic_gate
    end

    def catchphrase
        puts "-----------------------"
        puts "-----------------------"
        QUOTE.all[0].starWarsQuote
        puts "-----------------------"
        puts "-----------------------"
    end
end