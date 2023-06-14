require 'base64'
require 'mini_magick'
require 'rest-client'
require 'rspec'
require_relative '../lib/image_analyzer'

describe ImageAnalyzer do
  describe '.analyze' do
    before do
      allow(RestClient).to receive(:post).and_raise(RestClient::Exception, 'Simulated Failure')
      allow(ImageAnalyzer).to receive(:resize_image).and_return('dummy_path')
      allow(File).to receive(:new).and_return(double('File').as_null_object)
    end

    it 'retries the specified number of times' do
      expect(RestClient).to receive(:post).exactly(ImageAnalyzer::MAX_RETRIES + 1).times

      result = ImageAnalyzer.analyze('path_to_some_image')

      expect(result).to eq({ error: 'エラーが発生しました。もう一度やり直してください。' })
    end
  end
end
