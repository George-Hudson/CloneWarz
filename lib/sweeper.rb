require 'nokogiri'
require 'open-uri'
require './lib/clone_warz'

class Sweeper
  attr_reader :links, :page, :contents

  def initialize(url = default_url)
    @page = Nokogiri::HTML(open(url))
    @contents = wanted_content
    puts "initialized"
  end

  def default_url
    "http://www.thebikedepot.org/"
  end

  def wanted_content
    wanted_links.each do |link|
      Pages.insert Page.new(
        {
          body: content_of(link),
          heading: link.text,
          title: link.text,
          url: link['href'].gsub("/index.php","")
        }
      )
    end
  end

  def wanted_links
    @page.css('ul.menu').css('a')
  end

  def content_of(link)
    sub_page = Nokogiri::HTML(open(full_url(link)))
    sub_page.css('.item-page').to_html
  end

  def full_url(link)
    default_url[0..-2].to_s + link.attr('href').to_s
  end

end
