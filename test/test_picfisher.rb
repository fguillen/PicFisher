# frozen_string_literal: true

require "test_helper"

class TestPicfisher < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Picfisher::VERSION
  end

  def test_api_entry_point_exists
    assert ::Picfisher.respond_to?(:fish)
  end
end
