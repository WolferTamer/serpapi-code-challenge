require_relative '../src/carousel_image_extractor'


describe CarouselImageExtractor do
  
  unless Dir.exist?('test')
    Dir.mkdir('test')
  end
  
  context "When testing the CarouselImageExtractor class" do
    it "the instance should have a Hash @images value" do
      cie = CarouselImageExtractor.new("spec/support/van-gogh/van-gogh-paintings.html")
      images = cie.get_images
      expect(images).to be_truthy
      expect(images).to be_instance_of(Hash)
    end
    it "the extract method should produce a new file and return an array" do
      cie = CarouselImageExtractor.new("spec/support/titanic-cast/titanic-cast.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      arr = cie.extract(file_name)
      expect(arr).to be_truthy
      expect(arr).to be_instance_of(Array)
      expect(File).to exist(file_name)
      readable = File.readable?(file_name)
      expect(readable).to be_truthy
      File.delete(file_name)
    end
    it "the file produced by the extract method should follow the expected format" do
      cie = CarouselImageExtractor.new("spec/support/titanic-cast/titanic-cast.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      f = File.read(file_name)
      expect(f).to be_truthy
      data = JSON.parse(f)
      expect(data).to be_truthy
      arr = data[data.keys[0]]
      expect(arr).to be_truthy
      expect(arr[0]).to have_key("name")
      expect(arr[0]).to have_key("image")
      expect(arr[0]).to have_key("link")
      expect(arr[0]).to have_key("extensions")
      File.delete(file_name)
    end
  end
  context "When testing invalid entries to the CarouselImageExtractor class" do
    it "a nil parent object should return an empty JSON object" do
      cie = CarouselImageExtractor.new("spec/support/failure/parent_nil.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      arr = cie.extract(file_name)
      expect(arr).to be_empty
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      expect(data).to be_empty
      File.delete(file_name)
    end
    it "the data key should be used" do
      cie = CarouselImageExtractor.new("spec/support/failure/section_nil.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      expect(data.keys).to include("data")
      File.delete(file_name)
    end
    it "an invalid parent will return an empty JSON object" do
      cie = CarouselImageExtractor.new("spec/support/failure/wrong_parent.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      arr = cie.extract(file_name)
      expect(arr).to be_empty
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      expect(data).to be_empty
      File.delete(file_name)
    end
  end
  context "When comparing with expected values" do
    after {
      file_names = Dir.entries("test")
      file_names.each do |file_name|
        if file_name.end_with?("_test.json")
          File.delete("test/#{file_name}")
        end
      end
    }
    it "matches van gogh values" do
      cie = CarouselImageExtractor.new("spec/support/van-gogh/van-gogh-paintings.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      arr = data[data.keys[0]]

      expect(File).to exist("spec/support/van-gogh/van-gogh-paintings.json")
      f2 = File.read("spec/support/van-gogh/van-gogh-paintings.json")
      data2 = JSON.parse(f2)
      arr2 = data2[data.keys[0]]

      arr.each_with_index do |item, index|
        comparison = arr2[index]
        expect(comparison == item).to be_truthy
      end
      File.delete(file_name)
    end
    it "matches titanic values" do
      cie = CarouselImageExtractor.new("spec/support/titanic-cast/titanic-cast.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      arr = data[data.keys[0]]

      expect(File).to exist("spec/support/titanic-cast/titanic-cast.json")
      f2 = File.read("spec/support/titanic-cast/titanic-cast.json")
      data2 = JSON.parse(f2)
      arr2 = data2[data.keys[0]]

      arr.each_with_index do |item, index|
        comparison = arr2[index]
        expect(comparison == item).to be_truthy
      end
      File.delete(file_name)
    end
    it "matches steven spielberg values" do
      cie = CarouselImageExtractor.new("spec/support/steven-spielberg-movies/steven-spielberg-movies.html")
      file_name = "test/#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      arr = data[data.keys[0]]

      expect(File).to exist("spec/support/steven-spielberg-movies/steven-spielberg-movies.json")
      f2 = File.read("spec/support/steven-spielberg-movies/steven-spielberg-movies.json")
      data2 = JSON.parse(f2)
      arr2 = data2[data.keys[0]]

      arr.each_with_index do |item, index|
        comparison = arr2[index]
        expect(comparison == item).to be_truthy
      end
      File.delete(file_name)
    end
  end
end