require_relative 'headers'
require_relative 'lists'
require_relative 'formatting'

class Chisel

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def split_and_parse
    array = @text.split("\n\n")

    array.map! do |f|
      Headers.new(f).parse_headers
    end

    array.map! do |f|
      Lists.new(f).parse_ul_lists
    end

    array.map! do |f|
      Lists.new(f).parse_ol_lists
    end

    array.map! do |f|
      Formatting.new(f).parse_formatting
    end

    array.map! do |f|
      Formatting.new(f).parse_paragraphs
    end

    array.map! do |f|
      Formatting.new(f).parse_ampersands
    end

    array.join
  end

end

if __FILE__==$0
  input_string = File.open(ARGV[0]).read
  input_lines = input_string.lines.count
  output_file = File.open(ARGV[1], "w")
  chisel = Chisel.new(input_string)
  output_string = chisel.split_and_parse
  output_lines = output_string.lines.count
  output_file.write(output_string)
  puts "Converted #{ARGV[0]} (#{input_lines} lines) to #{ARGV[1]} (#{output_lines} lines)"
end
