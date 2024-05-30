# frozen_string_literal: true

require "test_helper"

module PicFisher
  class TestFishingBoat < Minitest::Test
    include TestHelpers

    def test_fish_downloads_images_from_file
      images_file_path = fixture("fishes.txt")
      images = [
        { url: "http://example.com/fishes/fish_01.jpg", output_file_name: "http_example_com_fishes_fish_01.jpg" },
        { url: "http://example.com/fishes/fish_02.jpg", output_file_name: "http_example_com_fishes_fish_02.jpg" },
        { url: "http://example.com/fishes/long/name%20fish_03.jpg", output_file_name: "http_example_com_fishes_long_name_20fish_03.jpg" }
      ]
      output_directory_path = "/tmp/output"

      images.each do |image|
        PicFisher::Downloader.expects(:download).with(image[:url], "#{output_directory_path}/#{image[:output_file_name]}")
      end

      PicFisher::FishingBoat.fish(images_file_path, output_directory_path)
    end
  end
end
