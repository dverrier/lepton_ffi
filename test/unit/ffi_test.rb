# frozen_string_literal: true

require 'helper'

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
class TestFFI < MiniTest::Test
  def test_supported_api_methods
    assert_equal 3, LeptonFFI::IMAGE_PNG
    assert_equal 18, LeptonFFI::IMAGE_DEFAULT
    assert(LeptonFFI.respond_to?(:versions))
    assert(LeptonFFI.respond_to?(:pix_read) )
    assert(LeptonFFI.respond_to?(:pix_write))
    assert(LeptonFFI.respond_to?(:scale))

    assert(LeptonFFI.respond_to?(:kernel_create))

  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize
