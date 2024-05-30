# frozen_string_literal: true

require "test_helper"

module PicFisher
  class TestLog < Minitest::Test
    COMBINATIONS = [
      { debug_level: :debug, methods: %i[debug info error] },
      { debug_level: :info, methods: %i[info error] },
      { debug_level: :error, methods: [:error] }
    ].freeze

    ALL_METHODS = %i[debug info error].freeze

    def setup
      @old_env = ENV["DEBUG_LEVEL"]
    end

    def teardown
      ENV["DEBUG_LEVEL"] = @old_env
    end

    def test_combinations
      COMBINATIONS.each do |combination|
        ENV["DEBUG_LEVEL"] = combination[:debug_level].to_s

        ALL_METHODS.each do |method|
          if combination[:methods].include?(method)
            Kernel.expects(:puts).with("PicFisher [#{method.upcase}] message (env: #{combination[:debug_level]})")
          else
            Kernel.expects(:puts).never
          end

          PicFisher::Log.send(method, "message (env: #{combination[:debug_level]})")

          Kernel.unstub(:puts)
        end
      end
    end

    def test_default_debug_level_should_be_info
      ENV.delete("DEBUG_LEVEL")

      Kernel.expects(:puts).with("PicFisher [DEBUG] message").never
      Kernel.expects(:puts).with("PicFisher [INFO] message")
      Kernel.expects(:puts).with("PicFisher [ERROR] message")

      PicFisher::Log.debug("message")
      PicFisher::Log.info("message")
      PicFisher::Log.error("message")
    end
  end
end
