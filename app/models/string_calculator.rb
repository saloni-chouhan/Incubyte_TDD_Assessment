class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    parsed_numbers = parse_numbers(numbers)
    check_for_negatives(parsed_numbers)
    parsed_numbers.sum
  end

  private

  def parse_numbers(numbers)
    if has_custom_delimiter?(numbers)
      delimiter, numbers_part = extract_custom_delimiter(numbers)
      numbers_part.split(delimiter).map(&:to_i)
    else
      numbers.split(/[,\n]/).map(&:to_i)
    end
  end

  def has_custom_delimiter?(numbers)
    numbers.start_with?("//")
  end

  def extract_custom_delimiter(numbers)
    delimiter = numbers[2]
    numbers_part = numbers.split("\n", 2)[1]
    [ delimiter, numbers_part ]
  end

  def check_for_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.first}"
    end
  end
end
