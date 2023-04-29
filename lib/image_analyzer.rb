module ImageAnalyzer
    def self.analyze(image_path)
        resized_image_path = resize_image(image_path)

        api_key = ENV['API_KEY']
        api_secret = ENV['API_SECRET']

        auth = 'Basic ' + Base64.strict_encode64("#{api_key}:#{api_secret}").chomp
        begin
          response = RestClient.post "https://api.imagga.com/v2/colors?overall_count=10&extract_object_colors=0", { :image => File.new(image_path, 'rb') }, { :Authorization => "Basic YWNjXzA1NjE5ZTllYzkxNzlkMDo3ZjY2MGMwYzBhNzk4YWY4MzgwNTc2ZTAwZDA1MjZiZg==" }
        rescue RestClient::Exception => e
          return { error: "API request failed" }
        end

        result = JSON.parse(response)
        image_data = Base64.encode64(File.read(resized_image_path))

        { result: result, image_data: image_data }
    end

    private

    def self.resize_image(image_path)
        image = MiniMagick::Image.open(image_path)
        image.resize "200x200"
        resized_image_path = File.join(Dir.tmpdir, SecureRandom.hex(8) + '.jpg')
        image.write(resized_image_path)
        resized_image_path
    end
end