class Chisel
  # require another class per type of parsing,
  # count hashtags and do headers first
  # then split all paragraphs into an array of paragraphs
  # combine all header code into few lines of code

  def initialize
  end             # => :initialize

  def parse(text)
    if text.include? "######"               # => false
      snippet = text.split("###### ").last
      "<h6>#{snippet}</h6>"
    elsif text.include? "#####"             # => false
      snippet = text.split("##### ").last
      "<h5>#{snippet}</h5>"
    elsif text.include? "####"              # => false
      snippet = text.split("#### ").last
      "<h4>#{snippet}</h4>"
    elsif text.include? "###"               # => false
      snippet = text.split("### ").last
      "<h3>#{snippet}</h3>"
    elsif text.include? "##"                # => false
      snippet = text.split("## ").last
      "<h2>#{snippet}</h2>"
    elsif text.include? "#"                 # => false
      snippet = text.split("# ").last
      "<h1>#{snippet}</h1>"
    elsif text.include? "/n/n"                # => false
      snippet = text
      "<p>#{snippet}</p>"
    else
      snippet = text                        # => "Hi my name is Shannon.\nI like wine."
      "<p>#{snippet}</p>"                   # => "<p>Hi my name is Shannon.\nI like wine.</p>"
    end                                     # => "<p>Hi my name is Shannon.\nI like wine.</p>"
  end                                       # => :parse
end                                         # => :parse

chisel = Chisel.new  # => #<Chisel:0x007fe51b9679d8>
chisel.parse("Hi my name is Shannon.

I like wine.")       # => "<p>Hi my name is Shannon.\nI like wine.</p>"

# chisel = Chisel.new
# input_string = File.open(ARGV[0]).read
# output_file = File.open(ARGV[1], "w")
# output_file.write(chisel.parse(input_string))
