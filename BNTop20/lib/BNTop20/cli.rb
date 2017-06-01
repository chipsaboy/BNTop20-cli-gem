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
				list_books
			elsif input.to_i > 0
				book = BNTop20::Book.find(input.to_i)
				print_info(book)
			elsif input == "exit"
				puts "Hasta la vista baby."
			else
				puts "Ok, now playing Justin Bieber: What do you mean?"
			end
		end
	end

	def list_books
		BNTop20::Book.all.each.with_index(1) do |book, i|
			puts "#{i}. #{book.name}"
		end
	end

	def print_info(book)
		puts ""
		puts "---------- #{book.name} ------------"
		puts ""
		puts "Author:     #{book.author}"
		puts "Price:        #{book.price}"
		puts "Discount:     #{book.discount}"
		puts "List Price:   #{book.old_price}"
		puts "Rating:       #{book.rating} stars"
		puts "Published:   #{book.release_date}"
		puts "URL:          www.barnesandnoble.com#{book.url}"
		puts ""
		puts "------------- Summary --------------"
		puts ""
		puts "#{book.overview}"
		puts ""
	end

end


