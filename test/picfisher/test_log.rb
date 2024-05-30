require "test_helper"

class PicFisher::TestLog < Minitest::Test
  COMBINATIONS = [
    { debug_level: :debug, methods: [:debug, :info, :error] },
    { debug_level: :info, methods: [:info, :error] },
    { debug_level: :error, methods: [:error] },
  ]

  ALL_METHODS = [ :debug, :info, :error ]

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
end
