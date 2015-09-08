class Headers
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def parse_headers
    if @text.start_with? "######"
      snippet = @text[7..-1]
      "<h6>#{snippet}</h6>

"
    elsif @text.start_with? "#####"
      snippet = @text[6..-1]
      "<h5>#{snippet}</h5>

"
    elsif @text.start_with? "####"
      snippet = @text[5..-1]
      "<h4>#{snippet}</h4>

"
    elsif @text.start_with? "###"
      snippet = @text[4..-1]
      "<h3>#{snippet}</h3>

"
    elsif @text.start_with? "##"
      snippet = @text[3..-1]
      "<h2>#{snippet}</h2>

"
    elsif @text.start_with? "#"
      snippet = @text[2..-1]
      "<h1>#{snippet}</h1>

"
    else
      @text
    end
  end

end
