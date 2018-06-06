class Calculator
  def initialize(input)
    @input = input
  end

  def result
    # remove outer whitespace
    @input.gsub!(/\s+/, "")

    # perform all multiplication and division
    while match = /(\d+(?:\.\d+)?)(\*|\/)(\d+(?:\.\d+)?)/.match(@input)
      # binding.pry
      calculate(match)
    end

    # perform all addition and subtraction
    while match = /(\d+(?:\.\d+)?)(\+|-)(\d+(?:\.\d+)?)/.match(@input)
      calculate(match)
    end

    # validate result and check for floats
    if /^-?\d+$/ =~ @input
      @input.to_i
    elsif /^-?\d+\.\d+$/ =~ @input
      @input.to_f.round(2)
    else
      "Invalid input"
    end
  end

  # calculate
  def calculate(match)
    substring, a, operator, b = match.to_a
    number = a.to_f.method(operator).(b.to_f)
    number = number.to_i if number % 1 == 0
    @input.sub!(substring, number.to_s)
  end
end
