# frozen_string_literal: true

require "test_helper"

module PicFisher
  class TestDownloader < Minitest::Test
    include TestHelpers

    def test_download
      image_url = "https://example.com/image_in_internet.png"
      fixture_path = fixture("fish_01.jpg")

      stub_request(:get, image_url)
        .to_return(body: File.new(fixture_path), status: 200)

      Dir.mktmpdir do |temporal_directory|
        output_path = "#{temporal_directory}/image_in_disk.jpg"
        PicFisher::Downloader.download(image_url, output_path)

        hash_original = Digest::MD5.file(fixture_path).hexdigest
        hash_downloaded = Digest::MD5.file(output_path).hexdigest

        assert File.exist?(output_path)
        assert_equal(hash_original, hash_downloaded)
      end
    end

    def test_download_invalid_url_should_raise_error
      image_url = "https://example.com/not_existing.png"

      stub_request(:get, "https://example.com/not_existing.png")
        .to_return(status: 404, body: "Error")

      assert_raises(PicFisher::Error) do
        PicFisher::Downloader.download(image_url, "OUTPUT_PATH")
      end
    end
  end
end
