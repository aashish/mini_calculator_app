require 'calculator'

class HomeController < ApplicationController
  def index
  end

  def calculate
    calc = Calculator.new(params[:expression])  

    if calc.valid?
      @result = calc.process
    else
      @result = 'Invalid input'
    end
    render :index
  end
end
