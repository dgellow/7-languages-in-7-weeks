# Day 2
#######

## Task 1
## Print the content of an array of sixteen numbers, four numbers at a time,
## using just `each'.
arr = []
(1..16).to_a.each do |n|
  arr << n
  if (n % 4).zero?
    puts arr.join
    arr = []
  end
end

##Now, do the same with `each_slice' in 'Enumerable`.
(1..16).each_slice(4).each {|arr| puts arr.join}
