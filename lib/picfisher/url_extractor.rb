# frozen_string_literal: true

require "uri"

module PicFisher
  # Extracts image urls from a string
  module URLExtractor
    # NOTE: using URI.regexp(["http", "https"]) didn't work for me
    URL_REGEX = %r{https?://[^\s,]+}
    IMAGE_EXTENSITONS = %w[.jpg .jpeg .png .gif .webp .bmp .ico .svg .tiff or .tif .psd .raw .cr2 .nrw .arw .dng .nef
                           .orf .sr2 .raf .tif .tiff .djvu].freeze

    # Extracts image urls from a string
    # @param string [String]
    # @return [Array<String>]
    # @example
    #   PicFisher::URLExtractor.extract("https://example.com/image_in_internet.png, https://example.com/another.png")
    def self.extract(string)
      result =
        string
        .scan(URL_REGEX)
        .select { |url| url.end_with?(*IMAGE_EXTENSITONS) }
        .uniq

      PicFisher::Log.debug("Extracted urls: #{result.join("|")}")

      result
    end
  end
end
