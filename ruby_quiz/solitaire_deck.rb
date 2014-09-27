class Solitaire_Deck

	attr_accessor :sol_deck

	def initialize
		@sol_deck = Array.new(52){|x| x+1}
		@sol_deck << "A" << "B"
	end

	def move_joker_A
		joker_pos = @sol_deck.index("A")

		if (joker_pos+1) == @sol_deck.length
			@sol_deck = @sol_deck.insert(1, @sol_deck.pop)
		else
			@sol_deck = @sol_deck.insert(joker_pos+1, @sol_deck.delete("A"))
		end

	end

	def move_joker_B
		joker_pos = @sol_deck.index("B")

		if (joker_pos+1) == @sol_deck.length
			@sol_deck = @sol_deck.insert(2, @sol_deck.pop)
		elsif (joker_pos+2) == @sol_deck.length
			@sol_deck = @sol_deck.insert(1, @sol_deck.delete("B") )
		else
			@sol_deck = @sol_deck.insert(joker_pos+2, @sol_deck.delete("B"))
		end
	end

	def tripple_cut
		top_cards = self.cut_top
		bottom_cards = self.cut_bottom

		top_cards.length.times{ @sol_deck << top_cards.shift}
		bottom_cards.length.times{ @sol_deck.unshift( bottom_cards.shift ) }

	end

	def cut_top
		top_cards = []
		until (@sol_deck[0] == "A") || (@sol_deck[0] == "B")
			top_cards << @sol_deck.shift
		end

		return top_cards
	end

	def cut_bottom
		bottom_cards = []
		until ( @sol_deck.last == "A" ) || ( @sol_deck.last == "B" )
			bottom_cards << @sol_deck.pop
		end

		return bottom_cards
	end

	def count_cut
		count = @sol_deck.last
		card_holder = []

		count.times{ card_holder << @sol_deck.shift }
		@sol_deck.insert(@sol_deck.length-1, card_holder).flatten!

	end

	def find_letter_value
		cards_to_skip = nil
		@sol_deck.first.is_a?(Integer) ? cards_to_skip = @sol_deck.first : cards_to_skip = 53
		if @sol_deck[cards_to_skip].is_a? Integer
			return @sol_deck[cards_to_skip]
		else
			return nil
		end
	end
end