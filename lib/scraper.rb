require 'open-uri'
require 'pry'
require "nokogiri"

class Scraper

  def self.scrape_index_page(index_url)
    html = open ('./fixtures/student-site/index.html')
    list = Nokogiri::HTML(html)
   # returns a list of student names
    names = list.css(".student-name")
    names_array = []
    names.each do |item|
      names_array << item.text
    end
  end  
    

  def self.scrape_profile_page(profile_url)
    
  end

end

