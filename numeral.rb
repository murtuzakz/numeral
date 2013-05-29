class Fixnum
	
	def to_numeral
		number = self.to_i
		numeral_string = ""
		sorted_numerals = RomanNumeral.mapping.sort{|a,b| b[1] <=> a[1]}
		divider = sorted_numerals.first[1]
		while number < divider
			sorted_numerals.delete_at(0)
			divider = sorted_numerals.first[1]
		end
		while (number/divider > 0) do 
			puts "number is #{number} and divider is #{divider}"
			numeral_string << RomanNumeral.mapping.invert[divider]
			number -= divider
			break if number == 0
			while number < divider do
				# a, number = to_name(number)
				# numeral_string << a
				sorted_numerals.delete_at(0)
				divider = sorted_numerals.first[1]
			end
		end
		return numeral_string
	end

	# def to_name(number)
	# 	if number > 900
	# 		puts " comes inside 900"
	# 		number -= 900
	# 		return "CM", number
	# 	elsif number > 400
	# 		number -= 400
	# 		return "CD", number
	# 	elsif number > 90
	# 		number -= 90
	# 		return "XC", number
	# 	elsif number > 40
	# 		number -= 40
	# 		return "XL", number
	# 	elsif number > 9 
	# 		number -= 9
	# 		return "IX", number			
	# 	elsif number > 4
	# 		number -= 4
	# 		return "IV", number
	# 	else
	# 		return "", number
	# 	end
	# end
end

class RomanNumeral
	NUMERALS_TRANSFORM = {"M" => 1000, "D" => 500, "C" => 100, "L" =>50, "X" =>10, "V" => 5, "I" => 1}
	class << self
		def mapping
			NUMERALS_TRANSFORM
		end
	end
end

x = gets
x = x.chomp.to_i
puts x.to_numeral