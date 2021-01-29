class Calculator

  def initialize(operater)
    @operater = operater
    @locked_add = false
    @locked_multiplication = false
    @locked_square = false
  end

  def add(num1, num2)
   return @operater.add(num1, num2) unless @locked_add
   :forbidden
  end

  def multiply(number_1, number_2)
   return @operater.multiply(number_1, number_2) unless @locked_multiplication
   :multiplication_forbidden
  end

  def square(number) 
    return @operater.square(number) unless @locked_square
    :square_forbidden
  end

  def unlock_add
    @locked_add = true
  end

  def locked_add?
    @locked_add
  end

  def lock_multiply
    @locked_multiplication = true
  end

  def locked_multiplied?
    @locked_multiplication
  end

  def lock_square
    @locked_square = true
  end

  def locked_square?
    @locked_square
  end
end
