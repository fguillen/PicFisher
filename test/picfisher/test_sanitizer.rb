require "test_helper"

class PicFisher::TestSanitizer < Minitest::Test
  def test_sanitize
    assert_equal "https_example_com_image1.jpg", PicFisher::Sanitizer.sanitize_image_url("https://example.com/image1.jpg")
    assert_equal "https_example_com_other_Big_20Comp-lex.jpg", PicFisher::Sanitizer.sanitize_image_url("https://example.com/other/Big%20Comp-lex.jpg")
  end
end
