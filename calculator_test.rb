require 'simplecov'
SimpleCov.start
require './test'
require './calculator.rb'

class Adder
  def add(num1, num2)
    @called_with = num1 + num2
    "happy message"
  end

  def what_was_add_called_with
    @called_with
  end
end

class Multiplier
  def multiply(num1, num2)
    @called_with = num1 * num2
    "multiplier message"
  end

  def what_was_multiply_called_with
    @called_with
  end
end

class Squarer
  def square(number)
    @called_with = number**2
    "square completed"
  end

  def what_was_square_called_with
    @called_with
  end
end

test "that it starts off unlocked" do
  adder = Adder.new
  calculator = Calculator.new(adder)

  result = calculator.locked_add?

  assert_equal(result, false)
end
test "that it can prevent from adding" do
  # Arrange
  adder = Adder.new
  calculator = Calculator.new(adder)
  calculator.unlock_add

  # Act
  result = calculator.locked_add?

  # Assert
  assert_equal(result, true)
end

test "that it adds two numbers when unlocked" do
  # Arrange - set up the situation to test within
  adder = Adder.new
  calculator = Calculator.new(adder)

  # Act - call the behaviour we want to test 
  result = calculator.add(1, 1)

  # Assert - check the result is what we expect
  assert_equal(result,  "happy message")
  assert_equal(adder.what_was_add_called_with, 2)
end

test "that it does not add when locked" do
  # Arrange - set up the situation to test within
  adder = Adder.new
  calculator = Calculator.new(adder)
  calculator.unlock_add
  # Act - call the behaviour we want to test
  result = calculator.add(1, 1)

  # Assert - check the result is what we expect
  assert_equal(result,  :forbidden)
  assert_equal(adder.what_was_add_called_with, nil)
end

test "that it starts off unlocked" do
  multiplier = Multiplier.new
  calculator = Calculator.new(multiplier)

  result = calculator.locked_multiplied?

  assert_equal(result, false)
end

test "that it can prevent from multiplying" do
  # Arrange - set up the situation to test within
  multiplier = Multiplier.new
  calculator = Calculator.new(multiplier)
  calculator.lock_multiply

  result = calculator.locked_multiplied?

  assert_equal(result, true)
end
test "that it multiplies two numbers when unlocked" do
  # Arrange - set up the situation to test within
  multiplier = Multiplier.new
  calculator = Calculator.new(multiplier)

  # Act - call the behaviour we want to test
  result = calculator.multiply(2, 5)

  # Assert - check the result is what we expect
  assert_equal(result,  "multiplier message")
  assert_equal(multiplier.what_was_multiply_called_with,  10)
end

test "that it does not multiply when locked" do
   # Arrange - set up the situation to test within
   multiplier = Multiplier.new
   calculator = Calculator.new(multiplier)
   calculator.lock_multiply

   # Act - call the behaviour we want to test
   result = calculator.multiply(2, 5)

   # Assert - check the result is what we expect
   assert_equal(result,  :multiplication_forbidden)
   assert_equal(multiplier.what_was_multiply_called_with, nil)
end

test "that it stars off unlocked" do
  # Arrange - set up the situation to test within
  squarer = Squarer.new
  calculator = Calculator.new(squarer)

   # Act - call the behaviour we want to test
   result = calculator.locked_square?

   # Assert - check the result is what we expect
  assert_equal(result,  false)
end

test "that it can lock" do
  # Arrange - set up the situation to test within
  squarer = Squarer.new
  calculator = Calculator.new(squarer)
  calculator.lock_square

  # Act - call the behaviour we want to test
  result = calculator.locked_square?

  # Assert - check the result is what we expect
  assert_equal(result,  true)
end
test "that it returns a squared number when unlocked" do
  # Arrange - set up the situation to test within
  squarer = Squarer.new
  calculator = Calculator.new(squarer)

  # Act - call the behaviour we want to test
  result = calculator.square(3)

  # Assert - check the result is what we expect
  assert_equal(result, "square completed")
  assert_equal(squarer.what_was_square_called_with,  9)
end

test "that it does not return a squared number when locked" do
  # Arrange - set up the situation to test within
  squarer = Squarer.new
  calculator = Calculator.new(squarer)
  calculator.lock_square

  # Act - call the behaviour we want to test
  result = calculator.square(3)
  
  # Assert - check the result is what we expect
  assert_equal(result, :square_forbidden)
  assert_equal(squarer.what_was_square_called_with,  nil)
end