# Highest level div for the images may have classes "TzHB6b j8lBAb p7kDMc cLjAic LMRCfc", must be verified with other
# pages
# iELo6 is the shared class for all the individual image sections, we can then grab the img value from that

require 'nokogiri'
require 'json'

van_gogh_doc = File.open('files/van-gogh-paintings.html') { |f| Nokogiri::HTML5(f) }
van_gogh_doc.errors.each do |error|
  puts error
end

parent_matches = van_gogh_doc.search('//div[@class="TzHB6b j8lBAb p7kDMc cLjAic LMRCfc"][1]')
parent = parent_matches.first

images = parent.search('.//div[@class="iELo6"]')

json_array = []

images.each do |image|
  a = image.search(".//a").first
  img = a.search(".//img").first
  title = a.search('.//div[contains(@class,"pgNMRc")]').first
  extensions = a.search('.//div[contains(@class,"cxzHyb")]')

  info_object = {
    "name" => title.text,
    "extensions" => extensions.map {|ext| ext.text },
    "link" => "https://www.google.com" + a['href'],
    "image" => img['data-src'] ? img['data-src'] : img['src'],
  }
  json_array << info_object
end

file = File.write('data.json', JSON.pretty_generate({"artworks" => json_array}))