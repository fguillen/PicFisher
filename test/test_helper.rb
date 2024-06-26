# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "picfisher"

require "minitest/autorun"
require "webmock/minitest"
require "mocha/minitest"

ENV["DEBUG_LEVEL"] = "silence"

module TestHelpers
  def fixture(texture_path)
    "#{__dir__}/fixtures/#{texture_path}"
  end
end
