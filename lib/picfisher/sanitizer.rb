# frozen_string_literal: true

module PicFisher
  # Sanitizes an image url
  module Sanitizer
    # Sanitizes an image url
    # @param url [String]
    # @return [String]
    # @example
    #   PicFisher::Sanitizer.sanitize_image_url("https://example.com/image_in_internet.png")
    def self.sanitize_image_url(url)
      filename_extension = File.extname(url)
      filename_extension_escaped = Regexp.escape(filename_extension) # to escape the dot "."
      result =
        url
        .sub(/#{filename_extension_escaped}$/, "")
        .gsub(/[^\w\s-]+/, "_")
        .gsub(/(^|\b\s)\s+($|\s?\b)/, "\\1\\2")
        .gsub(/\s+/, "_")

      result = "#{result}#{filename_extension}"
      PicFisher::Log.debug("Sanitizing url '#{url}': #{result}")
      result
    end
  end
end
