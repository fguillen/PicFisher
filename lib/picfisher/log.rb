# frozen_string_literal: true

module PicFisher
  # Print a message to the console
  # @param debug_level [Symbol]
  # @return [nil]
  # @example
  #   PicFisher::Log.debug("message")
  #   PicFisher::Log.info("message")
  #   PicFisher::Log.error("message")
  module Log
    def self.debug(message)
      output(:debug, message) if ["debug"].include? debug_level
    end

    def self.info(message)
      output(:info, message) if %w[debug info].include? debug_level
    end

    def self.error(message)
      output(:error, message) if %w[debug info error].include? debug_level
    end

    def self.output(level, message)
      final_message = "PicFisher [#{level.upcase}] #{message}"
      Kernel.puts(final_message)
    end

    def self.debug_level
      ENV["DEBUG_LEVEL"] || "info" # default is info
    end

    private_class_method :debug_level
  end
end
