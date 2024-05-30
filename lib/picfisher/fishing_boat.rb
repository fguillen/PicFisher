module PicFisher
  module FishingBoat
    # REVIEW: we could use keyword params if we see it adds readability
    def self.fish(images_file_path, output_directory_path)
      PicFisher::Log.info("Fishing from #{images_file_path} to #{output_directory_path}")

      file_to_string = File.read(images_file_path)
      urls = PicFisher::URLExtractor.extract(file_to_string)
      urls.each do |url|
        sanitized_url = PicFisher::Sanitizer.sanitize_image_url(url)
        PicFisher::Downloader.download(url, "#{output_directory_path}/#{sanitized_url}")
      end
    end
  end
end
