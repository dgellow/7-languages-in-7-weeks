#!/bin/env ruby

# A ruby module is a collection of functions and constants.
# By including a module as part of a class, those behaviors and constants become
# part of the class.
module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    # The `to_s' method is define in a class but used in the module
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

Person.new('matz').to_f
# => create the file 'object_12573620.txt' containing 'matz'
