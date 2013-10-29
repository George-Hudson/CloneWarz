require './lib/clone_warz/page'
require './lib/db'

class Pages < DB

  def self.all
    [
      Page.new({ title: "Home"}),
      Page.new({ title: "About"}),
      Page.new({ title: "Mission, Vision, and Values"}),
      Page.new({ title: "History"}),
      Page.new({ title: "Staff & Board"}),
      Page.new({ title: "Contact & Hours"}),
      Page.new({ title: "Privacy Policy"})
    ]
  end

end
