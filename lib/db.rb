require 'sequel'
require 'sqlite3'

class DB

  def self.database
    @database ||= Sequel.sqlite(file)
  end

  def self.environment
    ENV['RACK_ENV'] || "development"
  end

  def self.destroy
    @database = nil
    File.delete(file) if File.exists?(file)
  end

  def self.file
    "./lib/db/#{environment}.sqlite3"
  end
end
