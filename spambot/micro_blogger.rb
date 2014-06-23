require 'jumpstart_auth'
require 'bitly'

Bitly.use_api_version_3
bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing..."
		@client = JumpstartAuth.twitter
	end

	def run
		puts "Welcome to the JSL Twitter Client"
		puts "'q' to quit"
		puts "'t' to tweet"
		puts "'dm' to direct message"
		puts "'lf' to list followers"
		puts "'elt' for all latest tweets"
		puts "'s' for shortening the url"
		command = ""
		while command != 'q'
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(' '))
				when 'dm' then dm(parts[1], parts[2..-1].join(' '))
				when 'lf' then followers_list()
				when 'elt' then everyones_last_tweet
				when 's' then shorten(parts[1..-1].join(' '))
				else
					puts "Sorry I don't know how to #{command}"
			end
		end
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Sorry, message too long.  It is #{message.length} characters long."
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		screen_names = @client.followers.collect {|follower| follower.screen_name }
		if screen_names.include?(target)
			tweet("d #{target} #{message}")
		else
			puts "Sorry, you can only DM people who follow you."
			puts screen_names.class
		end
	end

	def followers_list
		screen_names = []
		@client.followers.each { |follower| screen_names << follower["screen_name"]}
		puts screen_names
	end

	# I don't like this function, so I have not implemented its use, or tested it.
	def spam_my_followers(message)
		followers = followers_list()
		followers.each { |follower| dm(follower, message) }
	end

	def everyones_last_tweet
		status_list = []
		friends = @client.friends
		
		#Store each friend object in a the status_list array
		friends.each do |friend|
			status_list << friend
		end

		#Sort status_list alphabetically.
		status_list.sort_by!{|friend| friend.name.downcase }
		#Iterate over status_list and print out the latest tweets
		status_list.each do |friend|
			name = friend.name
			status = friend.status.text
			timesstamp = friend.status.created_at
			puts "#{name} | #{timesstamp.strftime("%A, %b, %d")}"
			puts "#{status}"
			puts ""
		end
	end

	def shorten(original_url)
		puts "Shortened this URL: #{original_url}"
		return bitly.shorten(original_url).short_url
	end

end

blogger = MicroBlogger.new
blogger.run

















