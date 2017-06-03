class BNTop20::Book

	attr_accessor :name, :author, :price, :url, :pub_date, :old_price, :discount, :rating, :overview

	@@all = []

	def initialize
	end


	def self.all
		@@all
	end

	def self.find(i)
		self.all[i-1]
	end


end