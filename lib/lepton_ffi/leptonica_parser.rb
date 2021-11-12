# frozen_string_literal: true

module LeptonFFI
  # class LeptonicaParser
  class LeptonicaParser

    def initialize(file_name)
      @file_name = file_name
      @functions = []
      @known_types = {pix: Pix}
    end

    def run
      parse_file_for_function @file_name
    end

    def parse_file_for_function(fname)
      if File.exist?(fname)
          File.open(fname).each do |line|
              case line
              when c_function_name
                # store previous function definition
                @functions << @function if @function
                # puts "Function #{line.match(c_function_name)[:fname]}"
                # ap @function
                @function = {params: []}
                @function[:c_name] = line.match(c_function_name)[:fname]
                @function[:r_name] = ruby_style @function[:c_name]
              when c_function_param
                # puts "Param #{line.match(c_function_param)[:fparam]}"
                @function ||= {params: []}
                @function[:params] << line.match(c_function_param)[:fparam]
              when c_function_return
                # puts "Return #{line.match(c_function_return)[:freturn]}"
                @function ||= {}
                @function[:returns] = line.match(c_function_return)[:freturn]
              end
          end
      end
    end

    def c_function_name
      /^\s*\*\s+\\brief\s+(?<fname>\S+)\(\)$/
    end

    def c_function_param
      /\s*\*\s\\param\[in\]\s+(?<fparam>\w+)\s+[\s*\S*]{1,}$/
    end

    def c_function_return
      /^\s*\*\s\\return\s+(?<freturn>\w+)[,]?\s+[\s*\S*]{1,}$/
    end

    def ruby_style(c_name)
      c_name.gsub(/([A-Z])/, '_\1').downcase
    end

  end
end
