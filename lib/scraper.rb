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

     # make document
    profile_saw = Nokogiri::HTML(open(profile_url))
    # keywords to parse urls
    site_array = ["twitter", "linkedin", "github", "rss"]
    # empty placeholder hash
    student_hash = {}

     site_array.each do |site|
      # check for social links' presence
      if get_url_by_icon("#{site}", profile_saw).length > 0
      # update student_hash with found links
        student_hash.merge!({site.to_sym => get_url_by_icon("#{site}", profile_saw) })
      end
    end

     # the word blog isn't in the profile page. rename it from search term rss
    student_hash[:blog] = student_hash.delete(:rss) if student_hash.has_key?(:rss)

     # easily scrape quote and bio
    student_hash.merge!({:profile_quote => profile_saw.css(".profile-quote").text })
    student_hash.merge!({:bio => profile_saw.css(".bio-content p").text })

     #return filled-out hash
    student_hash



   end	 


 end

     
