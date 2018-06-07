require 'rails_helper'

RSpec.describe Calculator do

  it 'stores the input in class variable' do
    input = '1+2*3+4/5'
    object = Calculator.new(input)
    expect(object.instance_variable_get(:@input)).to eq(input)
  end

  it 'should result invalid input if expression is empty' do
    result = Calculator.new('').valid?
    expect(result).to eq(false)
  end

  it 'should result invalid input if expression is not valid' do
    result = Calculator.new('**33').valid?
    expect(result).to eq(false)
  end

  it 'should result invalid input if expression is not balanced' do
    result = Calculator.new('3+3-33/').valid?
    expect(result).to eq(false)
  end

  it 'should result invalid input if expression not contains alphabhet characters' do
    result = Calculator.new('1*2+a').valid?
    expect(result).to eq(false)
  end

  it 'should result invalid input if expression not contains not arthematic symbols' do
    result = Calculator.new('1*2#@').valid?
    expect(result).to eq(false)
  end

  it 'should result float if answer is float' do
    calc = Calculator.new('1.0+2.3322-3.1')
    expect(calc.process.round(2)).to eq( 0.23 )
  end

  it 'should result rounded to 0 decimals ' do
    calc = Calculator.new('1.0+2.0')
    expect(calc.process).to eq(3)
  end

  it 'should remove the white space from the input' do
    input = '1.0 + 2.0'
    result = Calculator.new(input).result
    expect(result).to eq(3)
  end

  it 'should work from long numbers ' do
    input = '100000000000 * 2000000'
    result = Calculator.new(input).result
    expect(result).to eq(200000000000000000)
  end

  it 'should work for given test case 5*3+1+6/2+9*100' do
    input = '5*3+1+6/2+9*100'
    result = Calculator.new(input).result
    expect(result).to eq(919)
  end
end
