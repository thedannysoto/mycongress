class Bills
    attr_accessor :name, :congress, :sponsor, :summary
    @@all = []

    def self.create_bills
        @@all.clear
        page = Scraper.bills_page
        bills = page.css("table.table tr")
        bill_each = page.css("table.table tr td")
        bill_info = Scraper.bill_page_and_summary
        

        x = 3
        y = 0
        # grabs info for each bill and creates new Bill instance
        bills.each do |bill|
            name = bill_each[x].css("a").children.text
            congress = bill_each[x-1].css("div").children.children.text
            
            sponsor = []
            bill_info[y].css("div.col-xs-7 p").children.text.split(". ").each do |text|
                sponsor << text
            end
            sponsor.shift
            sponsor.unshift(bill_info[y].css("a.name").children.text)
            
            summary = bill_info[y+1].css("div#libraryofcongress p").map do |paragraph|
                paragraph.text
            end
            Bills.new(name, congress, sponsor, summary)
            
            x += 4
            y += 2
        end
        Bills.bills_display
    end

    def initialize(name, congress, sponsor, summary)
        @name = name
        @congress = congress
        @sponsor = sponsor
        @summary = summary
        @@all << self 
    end

    def self.bills_display
        Print.print_header
        puts " "
        puts "#{@@all.length} bills and resolutions that are on the House and Senate calendars for the coming days".colorize(:blue)
        puts " "
        puts "------------------------------------------------------------------------------------------"
        counter = 1
        @@all.each do |bill|
            
            puts "#{counter}. #{bill.name}".colorize(:red)
            
            puts "------------------------------------------------------------------------------------------"
            counter +=1
        end
        
        puts " "
        puts " "
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'Read summary of a bill', "1"
            menu.choice 'See current headlines in U.S. Politcs', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 

        if choice == '2'
            Headlines.create_headlines
        elsif choice == 'EXIT'
            Print.print_exit
        else
            prompt = TTY::Prompt.new(active_color: :red)
            bill_choice = prompt.select("Please choose one of the bills:".colorize(:blue)) do |menu|
                x = 0
                while x < @@all.length
                    menu.choice "#{x+1}", "#{x}"
                    x += 1
                end
            end
            Bills.bill_summary(bill_choice)
        end
    end
    
    #does this have to be self?
    def self.bill_summary(bill_choice)
        Print.print_header
        puts "#{@@all[bill_choice.to_i].congress} Bill: #{@@all[bill_choice.to_i].name}".colorize(:red)
        puts "Bill Sponsor: ".colorize(:blue) + "#{@@all[bill_choice.to_i].sponsor[0]}, #{@@all[bill_choice.to_i].sponsor[1]}, #{@@all[bill_choice.to_i].sponsor[2]}".colorize(:blue)
        puts "------------------------------------------------------------------------------------------"
        puts " "
        @@all[bill_choice.to_i].summary.each do |paragraph|
            puts paragraph
            puts " "
        end
        puts " "
        
        prompt = TTY::Prompt.new(active_color: :red)
        choice = prompt.select("Please make a selection from the menu:".colorize(:blue)) do |menu|
            menu.choice 'See list of upcoming bills', "1"
            menu.choice 'See current headlines in U.S. Politcs', "2"
            menu.choice 'Exit My Congress', "EXIT"
        end 
        
        if choice == "1"
            Bills.bills_display
        elsif choice == "2"
            Headlines.create_headlines
        else  
            Print.print_exit
        end
    end

end