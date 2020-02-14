class Scraper

    def self.scrape
        #Scrapers to grab all info for bills
        @bills_page = Nokogiri::HTML(open('https://www.govtrack.us/congress/bills/'))
        bills = @bills_page.css("table.table tr")
        bill_each = @bills_page.css("table.table tr td")
        @bill_page_and_summary = []
        x = 3
        bills.each do |bill|
            url = bill_each[x].css("a")[0].attributes["href"].value
            # push specific bill url scraped
            @bill_page_and_summary << Nokogiri::HTML(open("https://www.govtrack.us#{url}"))
            # push specific bill summary url scraped
            @bill_page_and_summary << Nokogiri::HTML(open("https://www.govtrack.us#{url}/summary"))
            x += 4
        end

        #Scraper for the headlines option
        @headline_page = Nokogiri::HTML(open('https://knewz.com/topics/politics/'))
    end

    def self.bills_page
        @bills_page
    end

    def self.headline_page
        @headline_page
    end

    def self.bill_page_and_summary
        @bill_page_and_summary
    end
end