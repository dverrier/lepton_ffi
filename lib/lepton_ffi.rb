# frozen_string_literal: true

require 'ffi'
require 'lepton_ffi/version'
require 'lepton_ffi/leptonica_parser'

# module LeptonFFI
module LeptonFFI
  extend FFI::Library

  IMAGE_PNG = 3
  IMAGE_DEFAULT = 18

  # class kernel
  class Kernel < FFI::Struct
  end

  # # class FFIIntPtr
  # class FFIIntPtr < FFI::Struct
  #   layout :value, :int
  # end

  # # class FFIDoublePtr
  # class FFIDoublePtr < FFI::Struct
  #   layout :value, :double
  # end

  class Pix < FFI::Struct
  end

  class Pixa < FFI::Struct
  end

  ffi_lib '/usr/lib/x86_64-linux-gnu/libleptonica.so'

  attach_function :versions, 'getImagelibVersions', [], :string
  attach_function :pix_read, 'pixRead', [:string], Pix
  attach_function :pix_write, 'pixWrite', [:string, Pix, :int], :int
  attach_function :scale, 'pixScale', [Pix, :float, :float], Pix
  attach_function :kernel_create, 'kernelCreate', [:int, :int], Kernel


end
