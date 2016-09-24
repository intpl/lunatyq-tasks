#!/usr/bin/env ruby

require 'csv'
require './person.rb'

class PersonList
  def initialize
    @people = []
  end

  def grab_from_stdin
    CSV($stdin) do |list|
      list.shift # let's take care over 'name,lastname' line

      list.each do |row|
        @people << Person.new(row[0], row[1])
      end
    end
    self
  end

  def sort_by_first_name
    @people.sort! do |person1,person2|
      person1.first_name + person1.last_name <=> person2.first_name + person2.last_name
    end
    self
  end

  def sort_by_last_name
    @people.sort! do |person1,person2|
      person1.last_name + person1.first_name <=> person2.last_name + person2.first_name
    end
    self
  end

  def print_people
    @people.each do |person|
      puts person.first_name + " " + person.last_name
    end
  end
end

people_list = PersonList.new.grab_from_stdin

$ARGV.each_with_index do |argument, index|
  if argument == '--sort_by'
    if $ARGV[index + 1] == 'first_name'
      people_list.sort_by_first_name
    elsif $ARGV[index + 1] == 'last_name'
      people_list.sort_by_last_name
    end
  end
end

people_list.print_people
