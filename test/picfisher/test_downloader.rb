require "test_helper"

class Picfisher::TestDownloader < Minitest::Test
  include TestHelper

  def test_download
    image_url = "https://example.com/image_in_internet.png"
    fixture_path = "#{fixture}/fish_01.jpg"

    stub_request(:get, image_url)
      .to_return(body: File.new(fixture_path), status: 200)

    Dir.mktmpdir do |temporal_directory|
      output_path = "#{temporal_directory}/image_in_disk.jpg"
      Picfisher::Downloader.run(image_url, output_path)

      hash_original = Digest::MD5.file(fixture_path).hexdigest
      hash_downloaded = Digest::MD5.file(output_path).hexdigest

      assert File.exist?(output_path)
      assert_equal(hash_original, hash_downloaded)
    end
  end
end
