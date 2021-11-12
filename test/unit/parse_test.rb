# frozen_string_literal: true

require 'helper'

class TestParse < MiniTest::Test
  def setup
    @file = '../leptonica/src/readfile.c'
  end

  def test_parse_read
    parser = LeptonFFI::LeptonicaParser.new(@file)
    parser.run
    # assert_equal 'libgif', versions[0..5]
  end

  def test_c_function_name
    parser = LeptonFFI::LeptonicaParser.new(@file)
    l =  '* \brief   pixaReadFiles()'
    assert_equal 'pixaReadFiles', l.match(parser.c_function_name)[1]
  end

  def test_c_function_param
    parser = LeptonFFI::LeptonicaParser.new(@file)
    l =  ' * \param[in]    substr   [optional] substring filter on filenames; can be null'
    assert_equal 'substr', l.match(parser.c_function_param)[1]
  end

  def test_c_function_return
    parser = LeptonFFI::LeptonicaParser.new(@file)
    l =  ' * \return  pixa, or NULL on error'
    assert_equal 'pixa', l.match(parser.c_function_return)[1]
  end

  def test_c_name_conversion
    parser = LeptonFFI::LeptonicaParser.new(@file)
    c = 'pixReadHeader'
    assert_equal 'pix_read_header', parser = parser.ruby_style(c)
  end
end
