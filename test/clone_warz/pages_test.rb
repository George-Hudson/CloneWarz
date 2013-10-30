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
    data = {
      title: "Home",
    }
    Pages.table.insert(data)
    data.merge!({title: "About"})
    Pages.table.insert(data)
    data.merge!({title: "Mission, Vision and Values"})
    Pages.table.insert(data)
    data.merge!({title: "History"})
    Pages.table.insert(data)
    data.merge!({title: "Staff & Board"})
    Pages.table.insert(data)
    data.merge!({title: "Contact & Hours"})
    Pages.table.insert(data)
    data.merge!({title: "Privacy Policy"})
    Pages.table.insert(data)

    expected_pages = [
      Page.new({ title: "Home"}),
      Page.new({ title: "About"}),
      Page.new({ title: "Mission, Vision and Values"}),
      Page.new({ title: "History"}),
      Page.new({ title: "Staff & Board"}),
      Page.new({ title: "Contact & Hours"}),
      Page.new({ title: "Privacy Policy"})
    ]

    Pages.all.zip(expected_pages).each do |pair|
      assert_equal pair[1].title, pair[0].title
    end
  end

  def test_it_creates_a_pages_table
    schema = [[:id, {:allow_null=>false, :default=>nil, :primary_key=>true, :db_type=>"integer", :type=>:integer, :ruby_default=>nil}], [:title, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:url, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:heading, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:img, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:body, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"varchar(255)", :type=>:string, :ruby_default=>nil}], [:carousel_id, {:allow_null=>true, :default=>nil, :primary_key=>false, :db_type=>"integer", :type=>:integer, :ruby_default=>nil}]]
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
      carousel_id: nil
    }
    assert_equal 0, Pages.count

    Pages.insert(Page.new(data))
    assert_equal 1, Pages.count
  end

  def test_it_finds_all_records
    data = {
      title: "Home",
      url: "/",
      heading: "Home",
      img: "",
      body: "Welcome to Denver Bike Depot!",
      carousel_id: nil
    }
    Pages.create
    Pages.table.insert(data)
    Pages.table.insert(data)
    Pages.table.insert(data)
    Pages.table.insert(data)
    assert_equal 4, Pages.all.count
  end

  def test_it_finds_by_url
    data = {
      title: "Home",
      url: "/home"
    }
    Pages.table.insert(data)
    data.merge!({title: "About", url: "/about"})
    Pages.table.insert(data)
    data.merge!({title: "Mission, Vision and Values", url:"/mission"})
    Pages.table.insert(data)
    data.merge!({title: "History", url: "/history"})
    Pages.table.insert(data)
    data.merge!({title: "Staff & Board", url: "/staff"})
    Pages.table.insert(data)
    data.merge!({title: "Contact & Hours", url: '/contact'})
    Pages.table.insert(data)
    data.merge!({title: "Privacy Policy", url: "/privacy"})
    Pages.table.insert(data)
    assert_equal "Staff & Board", Pages.find_by_url("/staff").title
  end

  def test_it_rejects_invalid_urls
    data = {
      title: "Home",
      url: "/home"
    }
    Pages.table.insert(data)
    data.merge!({title: "About", url: "/about"})
    Pages.table.insert(data)
    data.merge!({title: "Mission, Vision and Values", url:"/mission"})
    Pages.table.insert(data)
    data.merge!({title: "History", url: "/history"})
    Pages.table.insert(data)
    data.merge!({title: "Staff & Board", url: "/staff"})
    Pages.table.insert(data)
    data.merge!({title: "Contact & Hours", url: '/contact'})
    Pages.table.insert(data)
    data.merge!({title: "Privacy Policy", url: "/privacy"})
    Pages.table.insert(data)
    assert_equal nil, Pages.find_by_url("/gobblygook")
  end

  def test_insert_gives_correct_id
    data = {
      title: "Home",
      url: "/home"
    }
    Pages.table.insert(data)
    assert_equal 1, Pages.find_by_url("/home").id
    data.merge!({title: "About", url: "/about"})
    Pages.table.insert(data)
    assert_equal 2, Pages.find_by_url("/about").id
  end

  def test_it_finds_by_id
    data = {
      title: "Home",
      url: "/home"
    }
    Pages.table.insert(data)
    assert_equal "/home", Pages.find_by_id(1).url
    data.merge!({title: "About", url: "/about"})
    Pages.table.insert(data)
    assert_equal "/about", Pages.find_by_id(2).url
  end

  def test_it_updates
    data = {
      title: "Home",
      url: "/home"
    }
    Pages.table.insert(data)
    assert_equal "/home", Pages.find_by_id(1).url
    data.merge!({title: "About", url: "/about"})
    Pages.table.insert(data)
    assert_equal "/about", Pages.find_by_id(2).url
  end

end
