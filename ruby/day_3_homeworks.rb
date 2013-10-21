# Day 3
#######
## Task 1
# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    include Enumerable
    
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end

    def read
      @csv_contents = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ' )
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ' )
      end
    end

    # To benefits from the Enumerable mixins the class must provide a method
    # `each' yielding successive members of the collection.
    def each
      @csv_contents.each do |line|
        yield CsvRow.new(@headers, line)
      end
    end
    
  end
end

# A class to represent a row. Yielded by `InstanceMethods::each'.
class CsvRow
  attr_accessor :values, :headers
  
  def initialize(headers, values)
    @headers = headers
    @values = values
  end

  def method_missing(name, *args)
    index = @headers.index(name.to_s)
    @values[index] unless index.nil? or @values.nil? 
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|line| puts line.inspect }
csv.each {|row| puts row.country}
