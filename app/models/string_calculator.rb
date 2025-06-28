class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    parsed_numbers = parse_numbers(numbers)
    validate_no_negatives(parsed_numbers)
    parsed_numbers.sum
  end

  private

  def parse_numbers(numbers)
    if has_custom_delimiter?(numbers)
      parse_with_custom_delimiter(numbers)
    else
      parse_with_default_delimiters(numbers)
    end
  end

  def has_custom_delimiter?(numbers)
    numbers.start_with?("//")
  end

  def parse_with_custom_delimiter(numbers)
    delimiter, numbers_part = extract_custom_delimiter(numbers)
    numbers_part.split(delimiter).map(&:to_i)
  end

  def parse_with_default_delimiters(numbers)
    numbers.split(/[,\n]/).map(&:to_i)
  end

  def extract_custom_delimiter(numbers)
    delimiter = numbers[2]
    numbers_part = numbers.split("\n", 2)[1]
    [ delimiter, numbers_part ]
  end

  def validate_no_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
  end
end
