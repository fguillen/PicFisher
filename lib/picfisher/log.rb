module PicFisher
  module Log
    def self.debug(message)
      if ["debug"].include? debug_level
        output(:debug, message)
      end
    end

    def self.info(message)
      if ["debug", "info"].include? debug_level
        output(:info, message)
      end
    end

    def self.error(message)
      if ["debug", "info", "error"].include? debug_level
        output(:error, message)
      end
    end

    private

    def self.output(level, message)
      final_message = "PicFisher [#{level.upcase}] #{message}"
      Kernel.puts(final_message)
    end

    def self.debug_level
      ENV["DEBUG_LEVEL"] || "info" # default is info
    end
  end
end
