require_relative 'carouselimageextractor'
require 'net/http'

puts "\e[1mWelcome to the Carousel Image Extractor!\e[22m"
puts "\nPlease input your desired input HTML file."

html_path = gets.chomp

readable = File.readable?(html_path)
html_extension = File.extname(html_path).eql?('.html') || File.extname(html_path).eql?('.htm')

if readable and html_extension
  puts "Got it! Preparing to read file at #{html_path}"
  puts "\nPlease input your desired output JSON file."

  output_path = gets.chomp

  writable = File.writable?(output_path) || File.writable?(File.dirname(output_path))
  json_extension = File.extname(output_path).eql?('.json')
  if !writable
    puts "'#{output_path}' is not writable or does not exist. Please try again."
    exit(-1)
  elsif !json_extension
    puts "'#{output_path}' is is not a JSON file. Please try again."
    exit(-1)
  end

  puts "Thank you! Now attempting to extract the images..."

  begin
    extractor = CarouselImageExtractor.new(html_path)
    extractor.extract(output_path)
    puts "Data successfully extracted to #{output_path}!"
  rescue StandardError => e
    puts "The following error occurred while attempting to extract the images: #{e.message}"
  end
elsif !readable
  puts "'#{html_path}' either does not exist or you don't have permission to write to it. Please try again."
else
  puts "'#{html_path}' does not lead to an HTML file. Please try again."
end





