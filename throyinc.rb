# royindict.rb
# Vorachet Jaroensawas, vjaroensawas@acm.org

require 'net/http'
require 'nokogiri'

trap("INT") { puts "Bye!"; exit}

loop do
  puts "Vocabulary Source: www.royin.go.th"
  puts "Enter Thai or English Vocabulary Word"
  w = gets.chomp
  uri = URI('http://www.royin.go.th/coined_word/func_lookup.php')
  res = Net::HTTP.post_form(uri, "word" => w, "funcName" => "lookupWord", "book_id" => "undefined", "status" => "lookup")
  doc = Nokogiri::HTML(res.body)
  doc.search("div.panel-info").each do |row|
    puts ""
    puts row.text.gsub(w, "\r\n").strip!
  end
  puts "\n\n"
end
