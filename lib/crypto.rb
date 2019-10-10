require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'


def crypto_scrapper
html_data = open('https://coinmarketcap.com/all/views/all/').read
nokogiri_object = Nokogiri::HTML(html_data)

#Création d'un tableau avec chaque nom symbole de chaque monnaie
crypto = nokogiri_object.xpath("//table[@id='currencies-all']/tbody/tr/td[contains(@class, 'col-symbol')]")
array = []
crypto.each do |my_element|
array << my_element.text
end



#Création d'un tableau avec chaque cours de chaque monnaie
#price = nokogiri_object.xpath("//*[@class='price']")
price = nokogiri_object.xpath("//table[@id='currencies-all']/tbody/tr/td[5]/a")
array2 = []
price.each do |my_element|
array2 << my_element.text.tr("$","")
end





#Création d'un dernier tableau contenant les élements des deux premiers tableaux associés l'un à l'autre par un ashe"
array3=[]



i = 0
array.each do 
array3 << {"#{array[i]}" => array2[i]}
i +=1
end



return array3
end

#puts crypto_scrapper
#puts crypto_scrapper[0]["BTC"]
#Mettre une méthode pour chaque partie ralentit fortement le programme (.each encastrés)






	




