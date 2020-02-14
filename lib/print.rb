class Print
    @@quotes = {
        :quote1 => [
            '"You will never know how much it has cost my generation to preserve your freedom.',
            'I hope you will make a good use of it."',
            "                                                            - Sam Adams"
        ],
        :quote2 => [
            '"Is life so dear or peace so sweet as to be purchased at the price of chains',
            'and slavery? Forbid it, Almighty God! I know not what course others may take,',
            'but as for me, give me Liberty or give me Death!"',
            '                                                            - Patrick Henry'
        ],
        :quote3 => [
            '"Where liberty dwells, there is my country."  - Benjamin Franklin'
        ],
        :quote4 => [
            '"This country will not be a good place for any of us to live in',
            'unless we make it a good place for all of us to live in."',
            '                                                             -Theodore Roosevelt'
        ],
        :quote5 => [
            '"Our great modern Republic. May those who seek the blessings of its institutions',
            'and the protection of its flag remember the obligations they impose."',
            '                                                             - Ulysses S. Grant'
        ]
    }

    #Grabs random quote from above hash for Main Menu
    def self.print_quote
        key = "#{@@quotes.keys[rand(@@quotes.size)]}"
        @@quotes[key.intern].each {|line| puts line}
        puts "------------------------------------------------------------------------------------------"
    end

    def self.print_header
        system "clear"
        puts '##     ## ##    ##     ######   #######  ##    ##  ######   ########  ########  ######   ######'.colorize(:red)  
        puts '###   ###  ##  ##     ##    ## ##     ## ###   ## ##    ##  ##     ## ##       ##    ## ##    ##'.colorize(:red) 
        puts '#### ####   ####      ##       ##     ## ####  ## ##        ##     ## ##       ##       ##'       
        puts '## ### ##    ##       ##       ##     ## ## ## ## ##   #### ########  ######    ######   ######'  
        puts '##     ##    ##       ##       ##     ## ##  #### ##    ##  ##   ##   ##             ##       ##' 
        puts '##     ##    ##       ##    ## ##     ## ##   ### ##    ##  ##    ##  ##       ##    ## ##    ##'.colorize(:blue) 
        puts '##     ##    ##        ######   #######  ##    ##  ######   ##     ## ########  ######   ######'.colorize(:blue)  
        puts " "
        puts "------------------------------------------------------------------------------------------"
    end

    def self.print_exit
        system "clear"
        puts " "
        puts " "
        puts '|* * * * * * * * * *'.colorize(:blue) + ' OOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '| * * * * * * * * *'.colorize(:blue) + '  :::::::::::::::::::::::::|'
        puts '|* * * * * * * * * *'.colorize(:blue) + ' OOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '| * * * * * * * * *'.colorize(:blue) + '  :::::::::::::::::::::::::|'
        puts '|* * * * * * * * * *'.colorize(:blue) + ' OOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '| * * * * * * * * *'.colorize(:blue) + '  ::::::::::::::::::::;::::|'
        puts '|* * * * * * * * * *'.colorize(:blue) + ' OOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '|:::::::::::::::::::::::::::::::::::::::::::::|'
        puts '|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '|:::::::::::::::::::::::::::::::::::::::::::::|'
        puts '|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts '|:::::::::::::::::::::::::::::::::::::::::::::|'
        puts '|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|'.colorize(:red)
        puts " "
        puts "Thank you for using My Congress. Goodbye and God Bless America!"
        puts " "
        puts "------------------------------------------------------------------------------------------"
        puts " "
        puts " "
        exit(true)
    end
end