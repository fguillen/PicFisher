module Picfisher
  module Sanitizer
    def self.sanitize_image_url(url)
      filename_extension = File.extname(url)
      filename_extension_escaped = Regexp.escape(filename_extension) # to escape the dot "."
      url =
        url
          .sub(/#{filename_extension_escaped}$/, "")
          .gsub(/[^\w\s_-]+/, "_")
          .gsub(/(^|\b\s)\s+($|\s?\b)/, "\\1\\2")
          .gsub(/\s+/, "_")

      "#{url}#{filename_extension}"
    end
  end
end
