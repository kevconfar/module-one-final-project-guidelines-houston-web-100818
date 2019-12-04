require 'open-uri'
require 'nokogiri'
doc = Nokogiri::HTML(open("https://www.hauntedrooms.com/haunted-places"))
entries = doc.css('.entry')