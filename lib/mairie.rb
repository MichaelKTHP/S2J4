require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'restclient'




def get_townhall_email(townhall_url)
page = Nokogiri::HTML(open(townhall_url))
townhall_url = page.xpath('//tr[4]/td[contains(text(), "@")]')
 return townhall_url.text
end





def get_townhall_url
page = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com/val-d-oise.html'))
townhall_url = page.xpath('//*[@class="lientxt"]/@href').map { |s| s.to_s.delete_prefix('.').prepend("https://www.annuaire-des-mairies.com")}
townhall_name = page.xpath('//*[@class="lientxt"]/text()')
array = []
townhall_url.each do |url|
array << url
end
return array

end

	array2 = []

i =0
get_townhall_url.each do 
array2 << get_townhall_email(get_townhall_url[i])
i = i+1
end

puts get_townhall_url[4]

