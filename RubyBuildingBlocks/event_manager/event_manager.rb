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

def peak_hours(hours_hash)	
	max_registrations = hours_hash.select { |hour, amount| amount == hours_hash.values.max }
	max_registrations.keys.join(', ')
end

def peak_days(days_hash)
	max_registrations = days_hash.select { |day, amount| amount == days_hash.values.max }
	max_registrations.keys.join(', ')
end

puts "EventManager initialized. List of registrants:"
puts ""

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

hours_hash = Hash.new(0)
days_hash = Hash.new(0)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = clean_phone(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  
  save_thank_you_letters(id,form_letter)
  
  reg_date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')
  hours_hash[reg_date.strftime('%H')] += 1
  days_hash[reg_date.strftime('%A')] += 1

  puts "#{name} #{phone_number} #{zipcode}"

end

puts ""
puts "Peak registration hour(s): #{peak_hours(hours_hash)}"
puts "Peak registration day(s): #{peak_days(days_hash)}"














