require 'open-uri'
require 'pry'
require 'nokogiri'

html=File.read('./fixtures/student-site/index.html')
sr=Nokogiri::HTML(html).css('.student-card')
sa=Nokogiri::HTML(html)

html2=File.read('./fixtures/student-site/students/mathieu-balez.html')
sp=Nokogiri::HTML(html2).css('.vitals-container')
binding.pry

#bio scrape_profile.css('.details-container p').text
