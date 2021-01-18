require './test'
require './calculator.rb'

test "that it adds two numbers" do
  # Arrange - set up the situation to test within
  calculator = Calculator.new
  number_1 = 1
  number_2 = 1
  
  # Act - call the behaviour we want to test
  result = calculator.add(number_1, number_2)

  # Assert - check the result is what we expect
  assert_equal(result,  2)
end