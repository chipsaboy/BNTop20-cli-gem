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


end