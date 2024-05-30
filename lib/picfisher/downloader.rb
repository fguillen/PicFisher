require "open-uri"

module PicFisher
  module Downloader
    def self.download(url, output_path)
      PicFisher::Log.debug("Fishing #{url} to #{output_path}")

      begin
        _dowload(url, output_path)
      rescue OpenURI::HTTPError => e
        message = "Failed to fish #{url}: #{e}"
        PicFisher::Log.error(message)
        raise PicFisher::Error.new(message)
      end
    end

    private

    def self._dowload(url, output_path)
      io_stream = OpenURI::open_uri(url)

      File.open(output_path, "wb") do |f|
        f.write(io_stream.read)
      end
    end
  end
end
