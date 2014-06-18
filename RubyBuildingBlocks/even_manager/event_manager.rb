require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone(phone_number)
	phone = phone_number.to_s.scan(/\d+/).join
	bad_number = ""
	if phone.nil?
		bad_number
	elsif phone.length == 10
		phone			
	elsif phone.length < 10
		bad_number
	elsif phone.length == 11 and phone[0] == 1
		phone[1..9]
	else
		bad_number
	end		
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{phone_number}"

  # save_thank_you_letters(id,form_letter)
end