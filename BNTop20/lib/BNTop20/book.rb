class BNTop20::Book

	attr_accessor :name, :author, :price, :url, :pub_date, :old_price, :discount, :rating, :overview

	@@all = []

	def initialize(attributes)
		attributes.each do |attribute_name, attribute_value|
			self.send("#{attribute_name}=", attribute_value)
		end

		@@all << self

	end

	def self.all
		@@all
	end

	def self.find(i)
		self.all[i-1]
	end

	def self.print_all
		all.each_with_index(1) do |book, i|
			puts "#{i}. #{book.name}"
		end
	end


end