# frozen_string_literal: true

require_relative "picfisher/version"

module Picfisher
  class Error < StandardError; end

  # REVIEW: we could use keyword params if we see it adds readability
  def self.fish(images_file_path, output_directory_path)
    puts "Picfisher is running..."
  end
end
