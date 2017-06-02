class BNTop20::Scraper

	def self.scrape_books
		book_info = {}
		index_html = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page=1"))
		index_html.css("ul#listView").css("li.clearer").collect do |book|
			book_info ={
				:name => book.css("p.product-info-title a").text,
				:author => book.css("span.contributors a").text,
				:url => "https://www.barnesandnoble.com#{book.css("p.product-info-title a").attribute("href")}"
			}

			book_page = Nokogiri::HTML(open(book_info[:url]))
			book_info[:price] = book_page.xpath("//*[@id='prodInfoContainer']/form[1]/p/span[1]").text
			book_info[:pub_date] = book_page.xpath("//section[@id='additionalProductInfo']/dl/dd[3]").text
			book_info[:old_price] = book_page.css("span.old-price").text
			book_info[:discount] = book_page.css("span.discount-amount").text
			book_info[:rating] = book_page.xpath("/html/body/main/main/section/div[7]/div[1]/span[2]/span[1]").text
			book_info[:overview] = book_page.css("div#productInfoOverview p").text

			book_info
		end
	end

end