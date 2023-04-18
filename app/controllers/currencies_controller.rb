class CurrenciesController < ApplicationController
  require 'stringio'

  def first_currency
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys
    
    render({:template => "currency_templates/step_one.html.erb"})
  end

def second_currency

  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  @array_of_symbols = @symbols_hash.keys
  @from_symbol = params.fetch("from_currency")

  render({:template => "currency_templates/step_two.html.erb"})

end

def convert

  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  @array_of_symbols = @symbols_hash.keys
  @from_symbol = params.fetch("from_currency")
  @to_symbol = params.fetch("a_symbol")
  @raw_convert = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}")
  @parsed_convert = JSON.parse(@raw_convert.string)
  @convert_hash = @parsed_convert.fetch("info")
  @rate = @convert_hash.fetch("rate")

  render({:template => "currency_templates/convert.html.erb"})
  
end

end
