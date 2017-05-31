class BNTop20::Scraper

	def get_html
		Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page=1"))
	end

	def scrape_html
		self.get_html.css("ul#listView").css("li.clearer")
	end

	def top20
		scrape_html.each do |b|
			url = b.css("p.product-info-title").css("a").attribute("href").value
			BNTop20::Book.new(url)
		end
	end

end