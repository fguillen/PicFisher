module PicFisher
  module Log
    def self.debug(message)
      if ["debug"].include? ENV["DEBUG_LEVEL"]
        output(:debug, message)
      end
    end

    def self.info(message)
      if ["debug", "info"].include? ENV["DEBUG_LEVEL"]
        output(:info, message)
      end
    end

    def self.error(message)
      if ["debug", "info", "error"].include? ENV["DEBUG_LEVEL"]
        output(:error, message)
      end
    end

    private

    def self.output(level, message)
      final_message = "PicFisher [#{level.upcase}] #{message}"
      Kernel.puts(final_message)
    end
  end
end
