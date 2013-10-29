require './test/test_helper'
require './lib/clone_warz/pages'

class PagesTest < Minitest::Test

  def setup
    Pages.create
  end

  def test_it_exists
    assert Pages
  end

  def teardown
    DB.destroy(:pages)
  end

  def test_all_returns_pages
    pages = [
      Page.new({ title: "Home"}),
      Page.new({ title: "About"}),
      Page.new({ title: "Mission, Vision, and Values"}),
      Page.new({ title: "History"}),
      Page.new({ title: "Staff & Board"}),
      Page.new({ title: "Contact & Hours"}),
      Page.new({ title: "Privacy Policy"})
    ]
    assert pages, Pages.all
  end

  def test_it_creates_a_pages_table
    schema = [[:id, {:allow_null=>false, :default=>nil, :primary_key=>true, :db_type=>"integer", :type=>:integer, :ruby_default=>nil}], [:title, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:url, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:heading, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:img, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:body, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:associated_carousel, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}]]
    assert Pages.database.table_exists?(:pages)
    assert_equal schema, Pages.database.schema(:pages)
  end

  def test_it_inserts_data
    data = {
      title: "Home",
      url: "/",
      heading: "Home",
      img: "",
      body: "Welcome to Denver Bike Depot!",
      associated_carousel: ""
    }
    expected_data = data.merge(id: 1)
    Pages.create
    Pages.table.insert(data)
    assert_equal expected_data, Pages.table.select.to_a.first
  end

  def test_it_finds_all_records
    data = {
      title: "Home",
      url: "/",
      heading: "Home",
      img: "",
      body: "Welcome to Denver Bike Depot!",
      associated_carousel: ""
    }
    Pages.create
    Pages.table.insert(data)
    Pages.table.insert(data)
    Pages.table.insert(data)
    Pages.table.insert(data)
    assert_equal 4, Pages.all.count
  end

end
