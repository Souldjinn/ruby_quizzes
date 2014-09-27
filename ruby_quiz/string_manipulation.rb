def clean_input(user_input)
  user_input = user_input.gsub(/\W/, "").upcase
  user_input = user_input + "X" * ((5 - user_input.size % 5) %5)
  # user_input = user_input.gsub(/([a-zA-Z]{5})/, '\1 ')
end

def convert_string_to_number(string)
	string.split("").map! {|x| x.ord-64}
end

def convert_num_to_string(array)
	array.map!{|x| (x+64).chr}
	array.join("").gsub(/(.{5})/, '\1 ')
end

def alphabetic(num)
	if num<=26
		return num
	else
		return num-26
	end
end

def apply_cipher(message, cipher)
encoded = message.zip(cipher).map! do |x|
		x = x.reduce(:+)
		if x > 26
			x-=26
		else
			x
		end
	end
end

def apply_dec_cipher(message, cipher)
decoded = message.zip(cipher).map! do |x|
		x = x.reduce(:-)
		if x < 1
			x +=26
		else 
			x
		end
	end
end