# Implementation of ASCII Hangman
require 'yaml'

class Hangman

	attr_accessor :guesses, :guessed_letters, :user_input, :word

	def initialize()
		dictionary = File.open("dictionary.txt", 'r') { |file| file.read }
		@words = dictionary.split.select { |word| word.length.between?(5,12)}
		
		new_game()		
	end

	def new_game()
		puts ""
		puts "WELCOME TO HANGMAN!"
		puts "==================="		
		puts ""
		puts "Guess a letter!"
		puts "Type 'save' to save." 
		puts "Type 'exit' to exit."
		puts "Would you like to load a previous game? (Y/N)"
		answer = gets.chomp
		@word = @words.sample.downcase		#MASTER WORD - CHOSEN RANDOMLY
		@encrypted_word = @word.split("").join(" ").gsub(/\w/, '_')
		@guesses = @word.length
		@guessed_letters = []			
		puts @encrypted_word		
		play()

	end

	def play()
		@user_input = gets.chomp
		handle_user_guesses()
	end

	def loose_game()
		if @guesses == 0
			puts "You are out of guesses!"
			puts "Your word is #{@word.upcase}"
			puts ''
			game_over_screen()
		end	
	end

	def game_over_screen()
		puts "Begin new game? (Y/N)"
		input = gets.chomp.downcase

		until input == 'y' or input == 'yes' or input == 'n' or input == 'no' do
			puts "Please enter 'y' or 'n'"
			input = gets.chomp.downcase
		end

		if input == 'y' or input == 'yes'
			puts ""
			puts "A NEW GAME BEGINS!"
			new_game()
		elsif input.downcase == 'n' or input.downcase == 'no'
			exit_game()
		end
	end

	def handle_user_guesses()
		update_encrypted_word()
		if @user_input == 'exit'
			exit_game()
		elsif @user_input == 'save'
			save_game()
		elsif @user_input == 'load'
			load_game()											
		elsif @user_input.length > 1
			puts "Please enter a single letter"				
		elsif @guessed_letters.include?(@user_input)
			puts "You you already made that guess"
		elsif @word.include?(@user_input)
			puts "Yup!"
			display_board()
		else
			@guessed_letters << @user_input
			@guesses -= 1
			display_board()
		end

	end

	def update_encrypted_word()
		new_word = ""
		old_word = @encrypted_word.split(" ").join
		@word.split('').each_with_index do |letter, index|
			if @user_input == letter
				new_word += " #{letter}"
			elsif "_" != old_word[index]
				new_word += " #{old_word[index]}"
			else
				new_word += " _"
			end
		end
		@encrypted_word = new_word[1..-1]
		check_win()				
	end

	def display_board()
		puts "You have #{@guesses} guesses remaining."
		puts ""
		puts @encrypted_word
		puts ""
		puts "YOUR GUESSES: #{guessed_letters.to_s}"
		loose_game()		
	end

	def exit_game()
		puts "Goodbye!"
		@user_input = exit
	end

	def win_game()
		puts @encrypted_word
		puts ""
		puts "CONGRATULATIONS! YOU WIN!"
		game_over_screen()
	end

	def check_win()
		check_word = @encrypted_word.split(" ").join
		if check_word == @word
			win_game()
		end
	end

	def load_game()
		save_file = File.open('saves/save_game.yaml', 'r') { |file| file.read }
		YAML.load(save_file)
		puts ""
		puts "Game Loaded"	
	end

	def save_game()
		Dir.mkdir('saves') unless Dir.exists? "saves"
		save_file = 'saves/save_game.yaml'
		File.open(save_file, 'w') do |file|
			file.puts YAML.dump(self)
		end
		puts ""
		puts "Game Saved"
		display_board()
	end
end

game = Hangman.new
loop do
	game.play()
	break if game.user_input.downcase == 'exit'	
end
