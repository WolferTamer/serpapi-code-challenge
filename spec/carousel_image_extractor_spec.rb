require_relative '../src/carousel_image_extractor'


describe CarouselImageExtractor do
  context "When testing the CarouselImageExtractor class" do
    it "the instance should have a Hash @images value" do
      cie = CarouselImageExtractor.new("files/van-gogh-paintings.html")
      images = cie.get_images
      expect(images).to be_truthy
      expect(images).to be_instance_of(Hash)
    end
    it "the extract method should produce a new file and return an array" do
      cie = CarouselImageExtractor.new("files/titanic-cast.html")
      file_name = "#{Time.new.inspect}_test.json"
      arr = cie.extract(file_name)
      expect(arr).to be_truthy
      expect(arr).to be_instance_of(Array)
      expect(File).to exist(file_name)
      readable = File.readable?(file_name)
      expect(readable).to be_truthy
      File.delete(file_name)
    end
    it "the file produced by the extract method should follow the expected format" do
      cie = CarouselImageExtractor.new("files/titanic-cast.html")
      file_name = "#{Time.new.inspect}_test.json"
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
    it "an empty JSON file should be created" do
      cie = CarouselImageExtractor.new("files/test.html")
      file_name = "#{Time.new.inspect}_test.json"
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
    it "matches van gogh values" do
      cie = CarouselImageExtractor.new("files/van-gogh-paintings.html")
      file_name = "#{Time.new.inspect}_test.json"
      cie.extract(file_name)
      expect(File).to exist(file_name)
      f = File.read(file_name)
      data = JSON.parse(f)
      arr = data[data.keys[0]]

      expect(File).to exist("files/expected-array.json")
      f2 = File.read("files/expected-array.json")
      data2 = JSON.parse(f2)
      arr2 = data2[data.keys[0]]

      arr.each_with_index do |item, index|
        comparison = arr2[index]
        output = (item.keys & comparison.keys).select { |key| item[key].eql? comparison[key] }
        expect(output).to be_truthy
      end
      File.delete(file_name)
    end
  end
end