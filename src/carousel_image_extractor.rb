require 'nokogiri'
require 'json'

class CarouselImageExtractor

  @@image_id_regex = /ii=\['([^()]+?)'\]/
  @@image_data_regex = /var s='([^()]+?)'/

  def initialize (file_path)
    @document = File.open(file_path) { |f| Nokogiri::HTML5(f) }
    if @document.errors.size > 0
      puts "\nWARNING: Syntax errors were found within the HTML file. This may affect your results.\n"
    end

    @images = gather_images
  end

  # Returns the @images member. Used in Rspec testing.
  def get_images
     @images
  end

  # Uses the provided document and pre-gathered image data to create a json file of all the entries in the carousel
  # Params:
  # - output_file_path: the path to write the resulting JSON data to
  def extract(output_file_path)
    begin

      # Carousels tend to have a data-attrid that begins with "kc:/" and tend to be the first of the matching elements to
      # appear on the page. This may fail if another "kc:/" element precedes the expected one.
      parent_matches = @document.search('//div[contains(@data-attrid,"kc:/")][1]')
      parent = parent_matches.first
      unless parent
        save_file({},output_file_path)
        return {}
      end

      # The best way to find the type of information the carousel holds is to see which tab the user has selected
      section = @document.search('//*[@role="tab"][@aria-selected="true"][1]').first

      # If there is no section info, default to the "data" key
      section_title = section ? section.text.downcase : "data"

      # Each link within the carousel holds both the image and text of each entry. There tend to be no other links within
      # the carousel.
      links = parent.search('.//a')

      json_array = []

      links.each do |a|
        img = a.search(".//img").first
        extensions = a.search(".//div/div")

        # The first object in this array is the title, so we shift it out
        title = extensions.shift

        # Some links start with "https://google...." while others do not, so we check for that here.
        # Hidden images use a URL source while images that aren't hidden use data that we have to parse the script tags
        # for
        info_object = {
          "name" => title.text,
          "extensions" => extensions.map {|ext| ext.text },
          "link" => a["href"].start_with?('/') ? "https://www.google.com" + a['href'] : a['href'],
          "image" => img['data-src'] ? img['data-src'] : @images[img['id']],
        }
        json_array << info_object
      end

      save_file({section_title => json_array}, output_file_path)

      json_array
    rescue NoMethodError
      save_file({},output_file_path)
      return {}
    end
  end

  private

  # Loops through every script element within the html to identify the ones that contain image data
  # Output:
  # A JSON dictionary that uses the image ids as keys for image data
  def gather_images
    image_object = {}
    @document.search('//script').each do |script|
      image_data = script.text.strip.match(@@image_data_regex)
      next unless image_data and image_data.size > 1
      image_id = script.text.strip.match(@@image_id_regex)
      next unless image_id and image_id.size > 1

      # The second match group excludes the identifying regex (i.e. "ii=['....']")
      image_object[image_id[1]] = image_data[1].encode('utf-8')
    end
    image_object
  end

  def save_file(json, path)
    File.open(path, 'w') do |f|
      f.write(JSON.pretty_generate(json))
    end
  end
end
