#!/usr/bin/env ruby

require 'csv'

names = []
last_names = []

CSV($stdin) do |list|
  list.shift

  list.each do |row|
    names << row[0]
    last_names << row[1]
  end
end

puts "Nazwiska: "
puts last_names.uniq

puts ; puts "Imiona:"
puts names.uniq
