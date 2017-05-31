class BNTop20::CLI

	def call
		BNTop20::Scraper.new.top20
		welcome_message
		start
	end

	def welcome_message
		puts ""
		puts "-----------------------------------------------------------"
		puts "* Welcome to the Barnes and Noble Top 20 Bestsellers List *"
		puts "-----------------------------------------------------------"
		puts ""
	end


	def start
		list_books
	end

	def list_books
		BNTop20::Book.all.each.with_index(1) do |book, i|
			puts "#{i}. #{book.name}"
		end
	end





end