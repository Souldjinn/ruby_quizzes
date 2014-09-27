load "solitaire_deck.rb"
require 'rspec'

describe Solitaire_Deck do 

		before(:each) do
			@fresh_deck = Solitaire_Deck.new
		end

	context "initialize" do

		it "Should create an array of 54 cards" do
			expect(@fresh_deck.sol_deck.length).to eq(54)
		end

		it "The deck should have 'A' and 'B' representing jokers" do
			expect(@fresh_deck.sol_deck).to include("A" && "B")
		end
	end
	

	context "move_joker_A" do

		it "should move the 'A' joker one card down in the deck" do
			expect{@fresh_deck.move_joker_A}.to change{@fresh_deck.sol_deck.index("A")}.by(1)
		end

		it "should move the 'A' joker to the second place in the deck
			if its at the bottom of the deck" do
			@fresh_deck.move_joker_A
			expect{@fresh_deck.move_joker_A}.to change{@fresh_deck.sol_deck.index("A")}.from(53).to(1)
		end
	end

	context "move_joker_A" do

		it "should move the 'B' joker two cards down in the deck" do
			@fresh_deck.sol_deck = ["B", 1, 2, 3, 4]
			expect{@fresh_deck.move_joker_B}.to change{@fresh_deck.sol_deck.index("B")}.by(2)
		end

		it "should move the 'B' joker to be the third card in the 
			deck if its the last card in the deck" do
			@fresh_deck.sol_deck = [1,2,3,4,"B"]
			expect{@fresh_deck.move_joker_B}.to change{@fresh_deck.sol_deck.index("B")}.from(4).to(2)
		end
	end

end
