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

		input = nil
		while input != "exit"
			puts "----------------------------------------------"
			puts "Which book do you want more information about?"
			puts "----------------------------------------------"
			input = gets.strip.downcase

			if input == "list"
				puts ""
				list_books
			elsif input.to_i > 0
				book = BNTop20::Book.find(input.to_i)
				print_info(book)
			elsif input == "exit"
				puts ""
				puts "Remember, reading is fundamental!"
				puts "Goodbye"
				puts ""
			else
				puts ""
				puts "Excuse me? Let's try that again."
				puts ""
			end
			puts ""
			puts "Type 'list' to see the list again, type 'exit' to quit"
		end
	end

	def list_books
		BNTop20::Book.all.each.with_index(1) do |book, i|
			puts "#{i}. #{book.name}"
		end
	end

	def print_info(book)
		puts "-------------- Name ----------------"
		puts ""
		puts "#{book.name}"
		puts ""
		puts "------------- Author ---------------"
		puts ""
		puts "#{book.author}"
		puts ""
		puts "------------- Price ----------------"
		puts ""
		puts "#{book.price}"
		puts ""
		puts "------------ Discount --------------"
		puts ""
		puts "#{book.discount}"
		puts ""
		puts "----------- List Price -------------"
		puts ""
		puts "#{book.old_price}"
		puts ""
		puts "------------- Rating ---------------"
		puts ""
		puts "#{book.rating} out of 5"
		puts ""
		puts "------------ Published -------------"
		puts ""
		puts "#{book.release_date}"
		puts ""
		puts "--------------- URL ----------------"
		puts ""
		puts "www.barnesandnoble.com#{book.url}"
		puts ""
		puts "------------- Overview -------------"
		puts ""
		puts "#{book.overview}"
		puts ""
	end

end


