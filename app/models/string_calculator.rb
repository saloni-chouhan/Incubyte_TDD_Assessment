class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    parse_numbers(numbers).sum
  end

  private

  def parse_numbers(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers_part = numbers.split("\n", 2)[1]
      numbers_part.split(delimiter).map(&:to_i)
    else
      numbers.split(/[,\n]/).map(&:to_i)
    end
  end
end
