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
		@name = web_url.css("h1").text
	end

	def author
		@author = web_url.css("span.contributors a").text
	end

	def price
		@price = web_url.xpath("//*[@id='prodInfoContainer']/form[1]/p/span[1]").text
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
		@rating = web_url.xpath("/html/body/main/main/section/div[7]/div[1]/span[2]/span[1]").text
	end

	def overview
		@overview = web_url.css("div#productInfoOverview p").text
	end


end