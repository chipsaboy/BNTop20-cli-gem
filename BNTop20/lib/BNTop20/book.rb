class BNTop20::Book

	attr_accessor :name, :author, :price, :url, :release_date, :old_price, :discount, :rating

	@@all = []

	def initialize(name = nil, author = nil, price = nil, url = nil)
		@name = name
		@author = author
		@price = price
		@url = url
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find(i)
		self.all[i-1]
	end




end