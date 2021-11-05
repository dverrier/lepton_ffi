# frozen_string_literal: true

require 'helper'

## rubocop:disable Metrics/MethodLength, Metrics/AbcSize
class TestAPI < MiniTest::Test
  def setup
    @image_name = 'test/images/4words.png'
  end

  def test_versions
    versions = LeptonFFI.versions
    assert_equal 'libgif', versions[0..5]
  end

  def test_pix_read_write
    pixa = LeptonFFI.pix_read(@image_name)
    result = LeptonFFI.pix_write('tmp/read_write.png', pixa, LeptonFFI::IMAGE_DEFAULT)
    assert_equal 0, result
  end

  def test_pix_scale
    pix = LeptonFFI.pix_read(@image_name)
    pixd = LeptonFFI.scale( pix, 2.0, 2.0)
    result = LeptonFFI.pix_write('/mnt/c/Users/dverr/Develop/lepton_ffi/tmp/scale_out.png', pixd, LeptonFFI::IMAGE_PNG)
    assert_equal 0, result
  end

  def test_kernel_create
    assert LeptonFFI::kernel_create(3,3)
  end

    # tess = TesseractFFI::Tesseract.new(file_name: @image_name)
    # tess.expects(:tess_create).returns(@handle)
    # tess.expects(:tess_delete).with(@handle)

    # tess.expects(:tess_get_utf8).with(@handle, 0).returns('ABCD')
    # assert_equal 'eng+lav', tess.tess_get_init_languages_as_string(@handle)
    # tess.recognize
    # TesseractFFI.tess_delete(@handle)
    # assert_equal [], tess.errors
    # assert_equal 'ABCD', tess.utf8_text
  # end

end
## rubocop:enable Metrics/MethodLength, Metrics/AbcSize
