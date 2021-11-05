# frozen_string_literal: true

module LeptonFFI
  # class TessException
  class LeptonException < Gem::Exception
    attr :error
    def initialize(error_msg)
      @error = error_msg
    end
  end
end
