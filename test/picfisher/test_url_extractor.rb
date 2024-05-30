# frozen_string_literal: true

require "test_helper"

module PicFisher
  class TestURLExtractor < Minitest::Test
    include TestHelpers

    def test_run
      string = File.read(fixture("images.txt"))
      result = PicFisher::URLExtractor.extract(string)

      assert_equal(17, result.count)

      expected_results = [
        "https://example.com/image1.jpg",
        "https://example.com/other/image1.jpg",
        "https://example.com/other/Se%20parated.jpg",
        "https://example.com/image2.png",
        "https://example.com/image3.gif",
        "https://example.com/image4.jpg",
        "https://example.com/image5.png",
        "https://example.com/image6.gif",
        "https://example.com/image7.jpg",
        "https://example.com/image8.png",
        "https://example.com/image9.gif",
        "https://example.com/image10.jpg",
        "https://example.com/image11.png",
        "https://example.com/image12.jpg",
        "https://example.com/image13.gif",
        "https://example.com/image14.png",
        "https://example.com/image15.jpg"
      ]

      expected_results.each do |url|
        assert(result.include?(url), "Excepted to find url '#{url}'")
      end
    end
  end
end
