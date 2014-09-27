load 'solitaire_deck.rb'
load 'string_manipulation.rb'

def cipher_sequence(deck)

   deck.move_joker_A
   deck.move_joker_B
   deck.tripple_cut
   deck.count_cut

  if value = deck.find_letter_value
  	return alphabetic(value) 
  else
  	cipher_sequence(deck)
  end

end

def generate_menu
	menu_option = nil
	until menu_option == "9"
		puts "1. Encrypt A message"
		puts "2. Decrypt A message"
		puts "9. Quit"
		puts "\n"

		menu_option = gets.chomp

		encrypt_message if menu_option == "1"
		decrypt_message if menu_option == "2"
	end
end


def encrypt_message

	deck_to_hold = Solitaire_Deck.new
	puts "Enter a message you would like encrypted"
	input = gets.chomp
	cipher = []
	input = clean_input(input)
	input.size.times{ cipher << cipher_sequence(deck_to_hold)}
	input =  convert_string_to_number(input)
	input = apply_cipher(input, cipher)
	encryption = convert_num_to_string(input)

	p encryption

end

def decrypt_message

	deck_to_hold = Solitaire_Deck.new
	puts "Enter the message you would like decrypted"
	input = gets.chomp
	input = input.gsub(" ", "")
	cipher = []
	input.size.times{ cipher << cipher_sequence(deck_to_hold) }
	input = convert_string_to_number(input)
	input = apply_dec_cypher(input, cipher)
	decryption = convert_num_to_string(input)

	p decryption

end

generate_menu


