# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "picfisher"

require "minitest/autorun"
require "webmock/minitest"

module TestHelper
  def fixture
    return "#{__dir__}/fixtures"
  end
end
