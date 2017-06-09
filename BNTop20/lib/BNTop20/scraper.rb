class BNTop20::Scraper

	API_URL = "https://www.barnesandnoble.com"

	def get_html
		Nokogiri::HTML(open("https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page=1"))
	end

	def scrape_html
		self.get_html.css("ul#listView").css("li.clearer")
	end

	def top20
		scrape_html.each do |b|
			url = b.css("p.product-info-title").css("a").attribute("href").value
			book = BNTop20::Book.new(url)
			book_doc = Nokogiri::HTML(open(API_URL + book.url))
			book.name = book_doc.css("h1").text
		end
	end

	def self.scrape_book_details(book)
		doc = Nokogiri::HTML(open(API_URL + book.url))

		book.author = doc.css("span.contributors a").text
		book.price = doc.xpath("//*[@id='prodInfoContainer']/form[1]/p/span[1]").text
		book.release_date = doc.xpath("//section[@id='additionalProductInfo']/dl/dd[3]").text
		book.old_price = doc.css("span.old-price").text
		book.discount = doc.css("span.discount-amount").text
		book.rating = doc.xpath("/html/body/main/main/section/div[7]/div[1]/span[2]/span[1]").text
		book.overview = doc.css("div#productInfoOverview p").text
	end

end