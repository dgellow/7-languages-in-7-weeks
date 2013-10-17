#!/bin/env ruby

# Demonstrate how to modify an existing class to add behavior
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

["", "person", nil].each do |element|
  puts element unless element.blank?
end
# => 'person'
