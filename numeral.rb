class Fixnum
	
	def to_numeral
		number = self.to_i
		numeral_string = ""
		sorted_numerals = RomanNumeral.mapping.sort{|a,b| b[1] <=> a[1]}
		divider = sorted_numerals.first[1]
		while (number/divider > 0) do 
			numeral_string << RomanNumeral.mapping.invert[divider]
			number -= divider
			break if number == 0
			while number < divider do
				sorted_numerals.delete_at(0)
				divider = sorted_numerals.first[1]
			end
		end
		return numeral_string
	end
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