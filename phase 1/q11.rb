class Calculator 
  def divide(a, b) 
    begin
      result = a / b 
      return result
    rescue ZeroDivisionError
      "cannot divide by zero"
    end
  end 
  def calculate_average(numbers)
    return "cannot divide by zero (empty list)" if numbers.empty?
    sum = 0.0 
    numbers.each do |num| 
    sum += num 
    end
    divide(sum, numbers.length)
  end
end
calc = Calculator.new
puts calc.calculate_average([10, 20, 30]) 