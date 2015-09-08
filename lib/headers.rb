class Headers
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def parse_headers
    # Needs to be refactored so it's less crappy - way too long!
    if @text.start_with? "######"
      spacedsnippet = @text[6..-1]
      snippet = spacedsnippet.lstrip
      "<h6>#{snippet}</h6>

"
    elsif @text.start_with? "#####"
      spacedsnippet = @text[5..-1]
      snippet = spacedsnippet.lstrip
      "<h5>#{snippet}</h5>

"
    elsif @text.start_with? "####"
      spacedsnippet = @text[4..-1]
      snippet = spacedsnippet.lstrip
      "<h4>#{snippet}</h4>

"
    elsif @text.start_with? "###"
      spacedsnippet = @text[3..-1]
      snippet = spacedsnippet.lstrip
      "<h3>#{snippet}</h3>

"
    elsif @text.start_with? "##"
      spacedsnippet = @text[2..-1]
      snippet = spacedsnippet.lstrip
      "<h2>#{snippet}</h2>

"
    elsif @text.start_with? "#"
      spacedsnippet = @text[1..-1]
      snippet = spacedsnippet.lstrip
      "<h1>#{snippet}</h1>

"
    else
      @text
    end
  end

end
