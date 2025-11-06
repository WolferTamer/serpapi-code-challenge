# Switch away from using classes, instead use data-attrid="kc:/..."
# Get Highest level kc
# Get list of all links inside that kc
# find image inside the link
# get raw text, parse it by new line



require 'nokogiri'
require 'json'
@image_id_regex = /ii=\['([^()]+?)'\]/
@image_data_regex = /var s='([^()]+?)'/
@van_gogh_doc = File.open('files/van-gogh-paintings.html') { |f| Nokogiri::HTML5(f) }
@van_gogh_doc.errors.each do |error|
  puts error
end

parent_matches = @van_gogh_doc.search('//div[contains(@data-attrid,"kc:/")][1]')
parent = parent_matches.first

links = parent.search('.//a')

json_array = []

@image_obj = {}

def gather_scripts
  @van_gogh_doc.search('//script').each do |script|
    image_data = script.text.strip.match(@image_data_regex)
    next unless image_data and image_data[1]
    image_id = script.text.strip.match(@image_id_regex)
    next unless image_id and image_id[1]
    @image_obj[image_id[1]] = image_data[1].encode('utf-8')

  end
end

gather_scripts

links.each do |a|
  img = a.search(".//img").first
  extensions = a.search("./div/div")
  title = extensions.shift

  info_object = {
    "name" => title.text,
    "extensions" => extensions.map {|ext| ext.text },
    "link" => "https://www.google.com" + a['href'],
    "image" => img['data-src'] ? img['data-src'] : @image_obj[img['id']],
  }
  json_array << info_object
end

file = File.write('data.json', JSON.pretty_generate({"artworks" => json_array}))
