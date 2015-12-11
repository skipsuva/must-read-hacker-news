require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize
    #list methods?
    url_parser
    page_scraper
    calculator
    launcher
  end

  def url_parser
    url = "https://news.ycombinator.com"
    @url_list = 4.times.with_object([]) do |n, array|
      array << "#{url}/news?p=#{n + 1}"
    end
  end

  def page_scraper
    @reading_list = []
    @url_list.each do |url|
      html = open(url)
      doc = Nokogiri::HTML(html)
      titles = doc.css(".title > a")
      score = nil
      comment_num = nil

      titles.each do |title_data|
        title = title_data.text[0..10]
        url = title_data.attribute("href").value
        subtexts = title_data.parent.parent.next.css(".subtext")
        subtexts.each do |subtext_line|
          score = subtext_line.css('.score').text.gsub(" points","").to_i
          comment_num = subtext_line.css('a').text.scan(/\d+ comments/).join.scan(/[0-9]+/).join.to_i
        end
        @reading_list << {article_title: title, link: url, points: score, comments: comment_num}
      end
    end
  end

  def calculator
    @comments = 0
    @score = 0
    @winning_url = nil

    @reading_list.each do |article_hash|
      if article_hash[:points] > @score && article_hash[:comments] > @comments
        @score = article_hash[:points]
        @comments = article_hash[:comments]
        @winning_url = article_hash[:link]
      else
        @winning_url
      end
    end
  end

  def launcher
    system "open #{@winning_url}"
  end
end

Scraper.new
