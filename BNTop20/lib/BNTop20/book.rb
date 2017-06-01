class BNTop20::Book

	attr_accessor :name, :author, :price, :url, :release_date, :old_price, :discount, :rating, :overview

	@@all = []

	def initialize(url = nil)
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find(i)
		self.all[i-1]
	end

	def web_url
		book_url = self.url
		@web_url = Nokogiri::HTML(open("https://www.barnesandnoble.com#{book_url}"))
	end

	def name
		@name = web_url.css("h1").text.strip
	end

	def author
		@author = web_url.css("span.contributors a").text.strip
	end

	def price
		@price = web_url.css("span.price current-price").text.strip
	end

	def release_date
		@release_date = web_url.xpath("//section[@id='additionalProductInfo']/dl/dd[3]").text.strip
	end

	def old_price
		@old_price = web_url.css("span.old-price").text.strip
	end

	def discount
		@discount = web_url.css("span.discount-amount").text.strip
	end

	def rating
		@rating = web_url.css("span.gig-average-review").text
	end

	def overview
		@overview = web_url.css("div#overview").css("p").text
	end


end