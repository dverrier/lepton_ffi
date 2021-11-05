# frozen_string_literal: true

require 'ffi'
require 'lepton_ffi/version'

# module LeptonFFI
module LeptonFFI
  extend FFI::Library

  IMAGE_PNG = 3
  IMAGE_DEFAULT = 18

  # class kernel
  class Kernel < FFI::Struct
  end

  # class FFIIntPtr
  class FFIIntPtr < FFI::Struct
    layout :value, :int
  end

  # class FFIDoublePtr
  class FFIDoublePtr < FFI::Struct
    layout :value, :double
  end

  class Pix < FFI::Struct
  end

  ffi_lib '/usr/lib/x86_64-linux-gnu/libleptonica.so'

  attach_function :versions, 'getImagelibVersions', [], :string
  attach_function :pix_read, 'pixRead', [:string], Pix
  attach_function :pix_write, 'pixWrite', [:string, Pix, :int], :int
  attach_function :scale, 'pixScale', [Pix, :float, :float], Pix
  attach_function :kernel_create, 'kernelCreate', [:int, :int], Kernel
  # attach_function :tess_create, 'TessBaseAPICreate', [], :pointer
  # attach_function :tess_delete, 'TessBaseAPIDelete', [:pointer], :int

  # attach_function :tess_init3,
  #                 'TessBaseAPIInit3', %i[pointer int string], :int


  # attach_function :tess_print_to_file, 'TessBaseAPIPrintVariablesToFile', %i[pointer buffer_in], :bool

  # attach_function :tess_get_double_variable, 'TessBaseAPIGetDoubleVariable', [:pointer, :pointer, FFIDoublePtr], :bool

end
