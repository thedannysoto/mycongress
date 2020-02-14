class Headlines
    attr_accessor :title, :blurb, :url

    @@all = []
    
    def self.create_headlines
        @@all.clear
        page = Scraper.headline_page

        x = 1
        y = 0

        page.css("h2").each do |article|
            title = article.text
            blurb = page.css("a.document-title span")[x].children[0].text
            url = page.css("a.document-title")[y].attributes["href"].value

            Headlines.new(title, blurb, url)

            x += 8
            y += 4
        end
        Headlines.headlines_display
    end

    def initialize(title, blurb, url)
        @title = title
        @blurb = blurb
        @url = url
        @@all << self
    end

    def self.headlines_display
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 0
        while x < 4
            puts "#{@@all[x].title.upcase}".colorize(:red)
            puts " "
            puts "  #{@@all[x].blurb}"
            puts " "
            puts "  Source: " + "#{@@all[x].url}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Show more headlines', "1"
            menu.choice 'See list of upcoming bills for House and Senate', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            Print.print_exit
        elsif choice == "2"
            Bills.create_bills
        else 
            Headlines.headlines_display_2
        end
    end

    def self.headlines_display_2
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 4
        while x < 8
            puts "#{@@all[x].title.upcase}".colorize(:red)
            puts " "
            puts "  #{@@all[x].blurb}"
            puts " "
            puts "  Source: " + "#{@@all[x].url}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Show more headlines', "1"
            menu.choice 'See list of upcoming bills for House and Senate', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            Print.print_exit
        elsif choice == "2"
            Bills.create_bills
        else 
            Headlines.headlines_display_3
        end
    end

    def self.headlines_display_3
        system "clear"
        puts " "
        puts "Current Headlines in U.S. Politics".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"

        x = 8
        while x < 11 && @@all[x] != nil
            puts "#{@@all[x].title.upcase}".colorize(:red)
            puts " "
            puts "  #{@@all[x].blurb}"
            puts " "
            puts "  Source: " + "#{@@all[x].url}".colorize(:blue)
            puts "------------------------------------------------------------------------------------------"
            x += 1
        end

        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'See list of upcoming bills for House and Senate', "1"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == "EXIT"
            Print.print_exit
        else
            Bills.create_bills
        end
    end
    
end