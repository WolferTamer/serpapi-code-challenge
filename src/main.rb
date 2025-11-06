require_relative 'carouselimageextractor'

extractor = CarouselImageExtractor.new('files/van-gogh-paintings.html')

extractor.extract('output.json')