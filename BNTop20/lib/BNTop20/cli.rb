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
		puts ""
	end





end