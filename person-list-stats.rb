#!/usr/bin/env ruby

require 'csv'

def count_occurrences(arr)
  counts = Hash.new 0
  arr.each { |i| counts[i] += 1 }
  counts.sort_by {|k,v| v}.reverse
end

names = []
last_names = []

CSV($stdin) do |list|
  list.shift

  list.each do |row|
    names << row[0]
    last_names << row[1]
  end
end

puts ">> Nazwiska: "
count_occurrences(last_names).each do |k,v|
  puts "#{k}: #{v}"
end

puts ; puts ">> Imiona:"
count_occurrences(names).each do |k,v|
  puts "#{k}: #{v}"
end
