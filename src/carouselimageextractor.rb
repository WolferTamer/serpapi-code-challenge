# Switch away from using classes, instead use data-attrid="kc:/..."
# Get Highest level kc
# Get list of all links inside that kc
# find image inside the link
# get raw text, parse it by new line



require 'nokogiri'
require 'json'

class CarouselImageExtractor


  @@image_id_regex = /ii=\['([^()]+?)'\]/
  @@image_data_regex = /var s='([^()]+?)'/

  def initialize (file_path)
    @document = File.open(file_path) { |f| Nokogiri::HTML5(f) }
    @document.errors.each do |error|
      puts error
    end

    @images = gather_scripts
  end

  def extract(output_file_path)
    parent_matches = @document.search('//div[contains(@data-attrid,"kc:/")][1]')
    parent = parent_matches.first

    links = parent.search('.//a')

    json_array = []

    links.each do |a|
      img = a.search(".//img").first
      extensions = a.search("./div/div")
      title = extensions.shift

      info_object = {
        "name" => title.text,
        "extensions" => extensions.map {|ext| ext.text },
        "link" => "https://www.google.com" + a['href'],
        "image" => img['data-src'] ? img['data-src'] : @images[img['id']],
      }
      json_array << info_object
    end

    file = File.write(output_file_path, JSON.pretty_generate({"artworks" => json_array}))
  end

  private
  def gather_scripts
    image_object = {}
    @document.search('//script').each do |script|
      image_data = script.text.strip.match(@@image_data_regex)
      next unless image_data and image_data.size > 1
      image_id = script.text.strip.match(@@image_id_regex)
      next unless image_id and image_id.size > 1
      image_object[image_id[1]] = image_data[1].encode('utf-8')
    end
    image_object
  end
end
