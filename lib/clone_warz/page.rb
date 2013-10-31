class Page
  attr_reader :id, :title, :url, :heading, :img, :body, :carousel_id

  def initialize(data = {})
    @id = data[:id].to_i
    @title = data[:title] || ""
    @url = data[:url] || ""
    @heading = data[:heading] || ""
    @img = data[:img] || ""
    @body = data[:body] || ""
    @carousel_id = data[:carousel_id].to_i
  end

  def edit(data = {})
    @title = data[:title] || @title
    @url = data[:url] || @url
    @heading = data[:heading] || @heading
    @img = data[:img] || @img
    @body = data[:body] || @body
    @carousel_id = data[:carousel_id].to_i || @carousel_id
  end

  def to_h
    {
      title: @title,
      url: @url,
      heading: @heading,
      img: @img,
      body: @body,
      carousel_id: @carousel_id
    }
  end
end
