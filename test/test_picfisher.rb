# frozen_string_literal: true

require "test_helper"

class TestPicfisher < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Picfisher::VERSION
  end

  def test_api_entry_point_exists
    assert ::Picfisher.respond_to?(:fish)
  end

  def test_calling_run_download_all_the_files
    Dir.mktmpdir do |output_directory_path|
      images_file_path = "#{__dir__}/fixtures/images.txt"

      Picfisher.fish(images_file_path, output_directory_path)

      assert(File.exist?("#{output_directory_path}/https_example_com_image1.jpg"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image2.png"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image3.gif"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image4.jpg"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image5.png"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image6.gif"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image7.jpg"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image8.png"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image9.gif"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image10.jpg"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image11.png"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image12.jpg"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image13.gif"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image14.png"))
      assert(File.exist?("#{output_directory_path}/https_example_com_image15.jpg"))
    end
  end
end
