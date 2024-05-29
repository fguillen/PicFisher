# Write test for the class @Picfisher::Sanitizer

require "test_helper"

class Picfisher::TestSanitizer < Minitest::Test
  def test_sanitize
    assert_equal "https_example_com_image1.jpg", Picfisher::Sanitizer.sanitize_image_url("https://example.com/image1.jpg")
    assert_equal "https_example_com_other_Big_20Comp-lex.jpg", Picfisher::Sanitizer.sanitize_image_url("https://example.com/other/Big%20Comp-lex.jpg")
  end
end
