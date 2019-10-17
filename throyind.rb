# royindict.rb
# Vorachet Jaroensawas, vjaroensawas@acm.org

require 'net/http'
require 'nokogiri'

trap("INT") { puts "Bye!"; exit}

loop do
  puts "Dictionary Source: www.royin.go.th"
  puts "Enter Thai Word"
  w = gets.chomp
  uri = URI('http://www.royin.go.th/dictionary/func_lookup.php')
  res = Net::HTTP.post_form(uri, "word" => w, "funcName" => "lookupWord", "status" => "domain")
  doc = Nokogiri::HTML(res.body)
  puts "\n\n"
  doc.search("div.panel-heading").drop(0).each do |row|
    print row.text.strip + " = " 
  end
  doc.search("div.panel-body").drop(1).each do |row|
    puts row.text.strip
  end
  print "\n\n"
end
