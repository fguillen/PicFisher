# frozen_string_literal: true

require "test_helper"

class TestPicFisher < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::PicFisher::VERSION
  end

  def test_api_entry_point_exists
    assert ::PicFisher.respond_to?(:fish)
  end

  def test_calling_run_download_all_the_files
    Dir.mktmpdir do |output_directory_path|
      images_file_path = "#{__dir__}/fixtures/images.txt"

      PicFisher.fish(images_file_path, output_directory_path)

      expected_files = [
        "https_example_com_image1.jpg",
        "https_example_com_image2.png",
        "https_example_com_image3.gif",
        "https_example_com_image4.jpg",
        "https_example_com_image5.png",
        "https_example_com_image6.gif",
        "https_example_com_image7.jpg",
        "https_example_com_image8.png",
        "https_example_com_image9.gif",
        "https_example_com_image10.jpg",
        "https_example_com_image11.png",
        "https_example_com_image12.jpg",
        "https_example_com_image13.gif",
        "https_example_com_image14.png",
        "https_example_com_image15.jpg",
      ]

      expected_files.each do |expected_file|
        assert(File.exist?("#{output_directory_path}/#{expected_file}"), "Excepted to find file '#{expected_file}'")
      end
    end
  end
end
