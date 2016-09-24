#!/usr/bin/env ruby

module PersonListMerge
  def self.merge_files(files_arr)
    files_arr.each do |file|
      File.open(file) do |list|
        list.drop(1).each do |row|
          puts row
        end
      end
    end
  end
end

PersonListMerge.merge_files(ARGV) if ARGV
