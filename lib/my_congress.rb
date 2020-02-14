
class MyCongress
   #front end, user input

    def call
        Print.print_header
        Print.print_quote
        puts " "
        puts "Welcome to My Congress!" 
        puts " "
        Scraper.scrape
        
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'See current headlines in U.S. Politcs', "1"
            menu.choice 'See list of upcoming bills for House and Senate', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            Print.print_exit
          elsif choice == "1"
            Headlines.create_headlines
          elsif choice == "2"
            Bills.create_bills
        end

    end

    
end