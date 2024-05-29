require "open-uri"

module Picfisher
  module Downloader
    # TODO: We need to add error handling here
    def self.run(url, output_path)
      io_stream = OpenURI::open_uri(url)

      File.open(output_path, "wb") do |f|
        f.write(io_stream.read)
      end
    end
  end
end
