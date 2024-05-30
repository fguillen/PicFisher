# frozen_string_literal: true

require_relative "picfisher/version"
require_relative "picfisher/sanitizer"
require_relative "picfisher/url_extractor"
require_relative "picfisher/downloader"
require_relative "picfisher/fishing_boat"
require_relative "picfisher/log"


module PicFisher
  class Error < StandardError; end

  # REVIEW: we could use keyword params if we see it adds readability
  def self.fish(images_file_path, output_directory_path)
    PicFisher::Log.info "PicFisher is running..."
    PicFisher::FishingBoat.fish(images_file_path, output_directory_path)
    PicFisher::Log.info "PicFisher is finished!"
  end
end
