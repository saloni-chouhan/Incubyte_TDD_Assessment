require "rails_helper"

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for single number" do
      calculator = StringCalculator.new
      expect(calculator.add("1")).to eq(1)
    end

    it "returns sum for two comma-separated numbers" do
      calculator = StringCalculator.new
      expect(calculator.add("1,5")).to eq(6)
    end

    it "handles any amount of numbers" do
      calculator = StringCalculator.new
      expect(calculator.add("1,2,3,4,5")).to eq(15)
    end

    it "handles newlines between number" do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "throws exception for negative numbers" do
      calculator = StringCalculator.new
      expect { calculator.add("-1,2") }.to raise_error("negative numbers not allowed -1")
    end
  end
end
