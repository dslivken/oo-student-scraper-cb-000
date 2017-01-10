require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :twitter, :linkedin, :github, :blog, :profile_quote, :bio

  def self.scrape_index_page(index_url)
    scrape = []
    html=File.read(index_url)
    scrape_raw=Nokogiri::HTML(html).css('.student-card')
    scrape_raw.each do |s|
      scrape << {:name => s.css('.student-name').text, :location => s.css('.student-location').text, :profile_url => "./fixtures/student-site/#{s.css('a')[0]['href']}"}
    end
    scrape
  end

  def self.scrape_profile_page(profile_url)
    scrape = {}
    social = []
    html=File.read(profile_url)
    s=Nokogiri::HTML(html).css('.vitals-container')
#    if s.css('.social-icon-container').css('a')[0]["href"] != nil
      social = s.css('.social-icon-container').css('a').collect {|l| l["href"]}
      puts "Social links: #{social}"
      social.each do |l|
        if l.include?("linkedin")
          scrape[:linkedin]=l
        elsif l.include?("twitter")
          scrape[:twitter]=l
        elsif l.include?("github")
          scrape[:github]=l
        elsif
          scrape[:blog]=l
        end
      end
      scrape[:profile_quote] = s.css('.profile-quote').text
    s2=Nokogiri::HTML(html).css('.details-container')
      scrape[:bio] = s2.css('p').text
    scrape
  end


end
