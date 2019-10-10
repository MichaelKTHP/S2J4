require 'nokogiri'
require 'open-uri'
require 'pry'
​COIN_MARKET_ALL_URL = 'https://coinmarketcap.com/all/views/all/'
​page = Nokogiri::HTML(open(COIN_MARKET_ALL_URL))
​currency_symbols = page.search("//table[@id='currencies-all']/tbody/tr/td[contains(@class, 'col-symbol')]")
puts ''
print currency_symbols
puts ''
print currency_symbols.text
puts ''




