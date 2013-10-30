class Page
  attr_reader :id, :title, :url, :heading, :img, :body, :carousel_id

  def initialize(data = {})
    @id = data[:id]
    @title = data[:title] || ""
    @url = data[:url] || ""
    @heading = data[:heading] || ""
    @img = data[:img] || ""
    @body = data[:body] || ""
    @carousel_id = data[:carousel_id] || 0
  end
end
