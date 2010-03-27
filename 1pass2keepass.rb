#!/usr/bin/ruby
require "rexml/document"
include REXML
require 'csv'



def usage (message = nil)
  if message
    puts "ERROR: #{message}"
  end
  puts """Usage: 1pass2keepass.rb 1pass.csv

Takes a _TAB_ delimeted csv file from 1password and prints XML suitable for import into keepassX
"""
  exit
end


input_file = ARGV[0]
unless ARGV[0]
  usage
end
unless File.exists?(input_file)
  usage "File '#{input_file}' does not exist" 
end

begin
  csv_data = CSV.open(input_file, 'rb', "\t")
  headers = csv_data.shift.map {|i| i.to_s }
  string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
  array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }
rescue
  usage $!
end


def usage (message = '')
  if message
    puts "ERROR: #{message}"
  end
  puts """ 
  Usage: 1pass2keepass.rb 1pass.csv
  Takes a _TAB_ delimeted csv file from 1password and prints XML suitable for import into keepassX
"""
  exit
end

doc = Document.new 
database = doc.add_element 'database'
group = database.add_element 'group'
group.add_element('title').text = 'Internet'
group.add_element('icon').text = '1'


def usage (message = '')
  if message
    puts "ERROR: #{message}"
  end
  puts """ 
  Usage: 1pass2keepass.rb 1pass.csv
  Takes a _TAB_ delimeted csv file from 1password and prints XML suitable for import into keepassX
"""
  exit
end

array_of_hashes.each do |row|
  entryNode = group.add_element 'entry'
  entryNode.add_element('username').text = row['username']
  entryNode.add_element('password').text = row['password']
  entryNode.add_element('title').text = row['title']
  entryNode.add_element('url').text = row['URL/Location']
  entryNode.add_element('comment').text = row['notes']
end

doc << XMLDecl.new
doc.write($stdout,2)
