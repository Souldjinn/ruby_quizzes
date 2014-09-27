challenge comes from :	http://rubyquiz.com/quiz1.html

The concept of the challenge is this:

	Take input, separate it into chunks of five characters
		separated by a space.

	Generate a cipher of the same length as the input.
		The cipher is created using a conceptual deck
		of cards. In my solution I just kept an array
		of numbers 1-52 with "A" and "B" being the joker
		cards.

		The cipher takes a few steps and has an organized
		method for shuffling the deck.

		Once the deck has been shuffled properly it uses
		the top card to generate a value which will tell
		you how many cards to skip to find the cipher value
		for a character.

	Once the cipher has been generated, the input and the
		cipher will both be converted to numbers based on
		their alphabetic number, A =1, Z = 26.

	The cipher and the input values will be added and converted
		back to a string of character values to give the user
		the encrypted message.

	Decryption works in a very similar manner but backwards.
		Its fairly simple if you take it step by step.

The code I have written so far is my first attempt.
