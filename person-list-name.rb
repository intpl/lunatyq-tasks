#!/usr/bin/env ruby

require 'csv'

last_names = []

CSV($stdin) do |list|
  list.shift

  list.each do |row|
    last_names << row[1]
  end
end

puts last_names.uniq
