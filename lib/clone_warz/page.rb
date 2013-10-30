class Page
  attr_reader :title, :url, :heading, :img, :body, :carousel_id

  def initialize(data = {})
    @title = data[:title] || ""
    @url = data[:url] || ""
    @heading = data[:heading] || ""
    @img = data[:img] || ""
    @body = data[:body] || ""
    @carousel_id = data[:carousel_id] || nil
  end
end
