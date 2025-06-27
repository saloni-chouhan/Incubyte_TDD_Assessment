class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    parse_numbers(numbers).sum
  end

  private

  def parse_numbers(numbers)
    numbers.split(',').map(&:to_i)
  end
end
