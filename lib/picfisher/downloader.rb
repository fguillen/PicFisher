# frozen_string_literal: true

require "open-uri"

module PicFisher
  # Downloads an image from an URL
  module Downloader
    # Downloads an image from an URL
    # @param url [String]
    # @param output_path [String]
    # @return [nil]
    # @raise [PicFisher::Error]
    # @example
    #   PicFisher::Downloader.download("https://example.com/image_in_internet.png", "OUTPUT_PATH")
    #   PicFisher::Downloader.download("https://example.com/not_existing.png", "OUTPUT_PATH")
    def self.download(url, output_path)
      PicFisher::Log.debug("Fishing #{url} to #{output_path}")

      begin
        _dowload(url, output_path)
      rescue OpenURI::HTTPError => e
        message = "Failed to fish #{url}: #{e}"
        PicFisher::Log.error(message)
        raise PicFisher::Error, message
      end
    end

    def self._dowload(url, output_path)
      io_stream = OpenURI.open_uri(url)

      File.binwrite(output_path, io_stream.read)
    end

    private_class_method :_dowload
  end
end
