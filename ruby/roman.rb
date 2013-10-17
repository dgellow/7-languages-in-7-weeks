#!/bin/env ruby

# Demonstrate the use of `method_missing' to create a flexible API
class Roman
  def self.method_missing name, *args
    roman = name.to_s
      .gsub("IV", "IIII")
      .gsub("IX", "VIIII")
      .gsub("XL", "XXXX")
      .gsub("XC", "LXXXX")

    {"I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100}
      .map {|letter, value| roman.count(letter) * value}
      .inject(:+)
  end
end

puts Roman.X
# => 10
puts Roman.XC
# => 90
puts Roman.XII
# => 12
puts Roman.XCVIIVIIIIIVVIIVVIC
# => 224
