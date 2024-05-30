# frozen_string_literal: true

require "test_helper"

class TestPicFisher < Minitest::Test
  include TestHelpers

  def test_that_it_has_a_version_number
    refute_nil ::PicFisher::VERSION
  end

  def test_api_entry_point_exists
    assert ::PicFisher.respond_to?(:fish)
  end

  def test_fish
    images_file_path = fixture("images.txt")
    images = [
      { url: "https://example.com/image1.jpg", output_file_name: "https_example_com_image1.jpg" },
      { url: "https://example.com/other/image1.jpg", output_file_name: "https_example_com_other_image1.jpg" },
      { url: "https://example.com/other/Se%20parated.jpg", output_file_name: "https_example_com_other_Se_20parated.jpg" },
      { url: "https://example.com/image2.png", output_file_name: "https_example_com_image2.png" },
      { url: "https://example.com/image3.gif", output_file_name: "https_example_com_image3.gif" },
      { url: "https://example.com/image4.jpg", output_file_name: "https_example_com_image4.jpg" },
      { url: "https://example.com/image5.png", output_file_name: "https_example_com_image5.png" },
      { url: "https://example.com/image6.gif", output_file_name: "https_example_com_image6.gif" },
      { url: "https://example.com/image7.jpg", output_file_name: "https_example_com_image7.jpg" },
      { url: "https://example.com/image8.png", output_file_name: "https_example_com_image8.png" },
      { url: "https://example.com/image9.gif", output_file_name: "https_example_com_image9.gif" },
      { url: "https://example.com/image10.jpg", output_file_name: "https_example_com_image10.jpg" },
      { url: "https://example.com/image11.png", output_file_name: "https_example_com_image11.png" },
      { url: "https://example.com/image12.jpg", output_file_name: "https_example_com_image12.jpg" },
      { url: "https://example.com/image13.gif", output_file_name: "https_example_com_image13.gif" },
      { url: "https://example.com/image14.png", output_file_name: "https_example_com_image14.png" },
      { url: "https://example.com/image15.jpg", output_file_name: "https_example_com_image15.jpg" },
    ]

    Dir.mktmpdir do |output_directory_path| # Not used, but it should exist to overpass the validations
      images.each do |image|
        PicFisher::Downloader.expects(:download).with(image[:url], "#{output_directory_path}/#{image[:output_file_name]}")
      end

      PicFisher.fish(images_file_path, output_directory_path)
    end
  end

  def test_fish_integration_mode
    images_file_path = "#{__dir__}/fixtures/fishes.txt"
    images = [
      { url: "http://example.com/fishes/fish_01.jpg", output_file_name: "http_example_com_fishes_fish_01.jpg", fixture: "fish_01.jpg" },
      { url: "http://example.com/fishes/fish_02.jpg", output_file_name: "http_example_com_fishes_fish_02.jpg", fixture: "fish_02.jpg" },
      { url: "http://example.com/fishes/long/name%20fish_03.jpg", output_file_name: "http_example_com_fishes_long_name_20fish_03.jpg", fixture: "fish_03.jpg" },
    ]

    images.each do |image|
      stub_request(:get, image[:url])
        .to_return(body: File.new(fixture(image[:fixture])), status: 200)
    end

    Dir.mktmpdir do |output_directory_path|
      PicFisher.fish(images_file_path, output_directory_path)
      images.each do |image|
        assert(File.exist?("#{output_directory_path}/#{image[:output_file_name]}"), "Excepted to find file '#{image[:output_file_name]}'")
        assert_equal(Digest::MD5.file(fixture(image[:fixture])), Digest::MD5.file("#{output_directory_path}/#{image[:output_file_name]}"), "Excepted to same has for file '#{image[:url]}'" )
      end
    end
  end
end
