require "./lib/image_renamer.rb"
require "minitest/autorun"

class TestImageRenamer < Minitest::Test

  def foobar
    fubar = "foobar"
    assert_equal "foobar", fubar
  end

end
