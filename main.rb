require 'date'

def print_birthdays(birth_year, proc)
	year = DateTime.now.year
	(birth_year..year).each { |year| proc.call(year) }
end

say_birthday = Proc.new { |arg| puts "It's #{arg}.  Happy Birthday!"}

def age_in_2020(birth_year)
	year = DateTime.now.year
	(year..2020).each do |year|
		if year == 2020
			puts "Happy Birthday!"
		else
			puts "It's #{year}"
			yield (year - birth_year)
		end
	end
end

puts "What year were you born?"
birth_year = gets.chomp.to_i

print_birthdays(birth_year, say_birthday)
age_in_2020(birth_year) { |age| puts "You are #{age} years old" }