load "string_manipulation.rb"
require 'rspec'

describe "Input" do 

  context "clean_input" do

  	it "should clean the input" do
  		input_string = "#$}Fifty**Miles"

  		expect( clean_input( input_string ) ).to eq( "FIFTYMILES" )
  	end

  	it "should add as many Xs as necessary to make the string size evenly 
  			divisible by 5" do

  			input_string = "testthis"

  			expect( clean_input( input_string ) ).to eq( "TESTTHISXX")
  	end

  	it "should remove spaces from input" do
  		input_string = "t e s ting this down"

  		expect( clean_input( input_string ) ).to eq( "TESTINGTHISDOWN" )
  	end	

  end


  context "convert_string_to_number" do

  	it "should take a string with values [A-Z] and return an
  		  array of numbers" do

  		string = "ABCDE"

  		expect( convert_string_to_number( string ) ).to eq( [1,2,3,4,5] )
  	end

  end

  context "convert_num_to_string" do

  	it "should take an array of numbers and return a string" do
  			array = [1,2,3,4,5]

  		expect( convert_num_to_string( array ) ).to eq( "ABCDE " )
  	end

  end

  context "alphabetic" do
  	it "only works for 1-52, will return 1-26" do
  		expect( alphabetic(49) ).to eq( 23 )
  	end

  end

  context "apply_cipher" do
  	it "takes two arrays and adds their values together" do
  		array1 = [8, 12, 4]
  		array2 = [7, 8, 20]

  		expect( apply_cipher( array1, array2 ) ).to eq( [15, 20, 24] )
  	end

  	it "also only works for numbers 1-52, and will make sure
  			the values in the output array are not over 26" do
  			array1 = [15, 26, 30]
  			array2 = [13, 1, 5]

  			expect( apply_cipher( array1, array2 ) ).to eq( [2, 1, 9] )
  		end
  end

  context "apply_dec_cipher" do
  	it "takes two arrays and subtracts the values of 
  			the second from the first" do
  			array1 = [15, 19, 12]
  			array2 = [8, 18, 4]

  			expect( apply_dec_cipher( array1, array2 ) ).to eq( [7, 1, 8] )
  		end

  		it "only works for values between 1-26 and will make sure 
  			  to return only values between 1-26." do
  			  array1 = [14, 6, 21]
  			  array2 = [26, 18, 10]

  			  expect( apply_dec_cipher( array1, array2 ) ).to eq( [14, 14, 11] )
  			end
  end

end


