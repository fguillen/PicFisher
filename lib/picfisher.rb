# frozen_string_literal: true

require_relative "picfisher/version"
require_relative "picfisher/sanitizer"
require_relative "picfisher/url_extractor"
require_relative "picfisher/downloader"
require_relative "picfisher/fishing_boat"
require_relative "picfisher/log"

# Extracts the image urls from the given file and download them to the given directory
module PicFisher
  class Error < StandardError; end

  # Extracts the image urls from the given file and download them to the given directory
  # @param images_file_path [String]
  # @param output_directory_path [String]
  # @return [nil]
  # @raise [PicFisher::Error]
  # @example
  #   PicFisher.fish("images.txt","~/Downloads/fished_images")
  def self.fish(images_file_path, output_directory_path)
    PicFisher::Log.info "PicFisher [#{PicFisher::VERSION}] is running..."

    run_validations(images_file_path, output_directory_path)

    PicFisher::FishingBoat.fish(images_file_path, output_directory_path)
    PicFisher::Log.info "PicFisher is finished!"
  end

  class << self
    private

    def run_validations(images_file_path, output_directory_path)
      validate_paths(images_file_path, output_directory_path)
      validate_origin_exists(images_file_path)
      validate_output_exists(output_directory_path)
    end

    # rubocop:disable Style/GuardClause
    def validate_paths(images_file_path, output_directory_path)
      if images_file_path.nil? || output_directory_path.nil?
        message = "Use: picfisher <images_file_path> <output_directory_path>"
        PicFisher::Log.error(message)
        raise PicFisher::Error, message
      end
    end

    def validate_origin_exists(images_file_path)
      unless File.exist?(images_file_path)
        message = "File not found: #{images_file_path}"
        PicFisher::Log.error(message)
        raise PicFisher::Error, message
      end
    end

    def validate_output_exists(output_directory_path)
      unless Dir.exist?(output_directory_path)
        message = "Directory not found: #{output_directory_path}"
        PicFisher::Log.error(message)
        raise PicFisher::Error, message
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
