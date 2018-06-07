class Calculator
  attr_accessor :input

  def initialize(input)
    @input = input.gsub(/\s+/, "")
  end

  def process(input = @input)
     [:+, :-, :*, :/].each do |op|
      factors = input.split(op.to_s)
      return factors.map {|x| process(x) }.inject(op) if factors.size > 1
     end
    (input.to_f).round(2) # No calculation needed
  end

  def valid?
    if @input.empty?
      return false
    else
      return !(/[^\+\-\*\/\d+(?:\.\d+)?]|^\W|\W{2,}|\W$/ =~ @input)
    end
  end

  def result
    process(@input)
  end 
end
