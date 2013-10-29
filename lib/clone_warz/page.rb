class Page
  attr_reader :title, :url, :heading, :img, :body, :associated_carousel

  def initialize(data = {})
    @title = data[:title] || ""
    @url = data[:url] || ""
    @heading = data[:heading] || ""
    @img = data[:img] || ""
    @body = data[:body] || ""
    @associated_carousel = data[:associated_carousel] || ""
  end
end
