require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'


def data
html_data = open('https://coinmarketcap.com/all/views/all/').read
end

def noko
nokogiri_object = Nokogiri::HTML(data)
return nokogiri_object
end

def symbol
#Création d'un tableau avec chaque nom symbole de chaque monnaie
crypto = noko.xpath("//table[@id='currencies-all']/tbody/tr/td[contains(@class, 'col-symbol')]")
array = []
crypto.each do |my_element|
array << my_element.text
end
return array

end


def prices
#Création d'un tableau avec chaque cours de chaque monnaie
#price = nokogiri_object.xpath("//*[@class='price']")
price = noko.xpath("//table[@id='currencies-all']/tbody/tr/td[5]/a")
array2 = []
price.each do |my_element|
array2 << my_element.text.tr("$","")
end
return array2
end




def crypto_scrapper
#Création d'un dernier tableau contenant les élements des premiers tableau associés l'un à l'autre par un ashe"
array3=[]
i = 0
symbol.each do 
array3 << {"#{symbol[i]}" => prices[i]}
i +=1
end

return array3
end	

puts crypto_scrapper







	




