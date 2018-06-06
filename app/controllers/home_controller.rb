require 'calculator'

class HomeController < ApplicationController
  def index
  end

  def calculate
    exp = params[:expression].gsub(/\s+/, "") 
    render :index if exp.nil?
    @result = Calculator.new(exp).result
    render :index
  end
end
