require './test/test_helper'
require './lib/db'

class DBTest < Minitest::Test

  def setup
    @file = './lib/db/test.sqlite3'
  end

  def teardown
    DB.destroy
  end

  def test_it_exists
    assert DB
  end

  def test_it_creates_a_new_database
    refute File.exists?(@file)
    db = DB.database
    db.create_table :test do
      primary_key :id
      String :title
      String :url
      String :heading
      String :img
      String :body
      String :associated_carousel
    end
    assert File.exists?(@file)
  end
end
