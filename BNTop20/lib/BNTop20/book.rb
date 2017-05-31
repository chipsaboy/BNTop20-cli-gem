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
		@web_url = Nokogiri::HTML(open("http://www.barnesandnoble.com#{book_url}"))
	end

	def name
		@name = web_url.css("h1").text
	end

	def author
		@author = web_url.css("span.contributors").attribute("href").text
	end

	def price
		@price = web_url.css("span.price current-price").text
	end

	def release_date
		@release_date = web_url.xpath("//section[@id='additionalProductInfo']/dl/dd[3]").text
	end

	def old_price
		@old_price = web_url.css("span.old-price").text
	end

	def discount
		@discount = web_url.css("span.discount-amount").text
	end

	def rating
		@rating = web_url.css("span.gig-average-review").text
	end

	def overview
		@overview = web_url.css("div#overview").css("p").text
	end


end