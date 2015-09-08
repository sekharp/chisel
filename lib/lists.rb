class Lists
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def parse_ul_lists
    # needs to be rewritten to catch multiple elements of list - so each line of * split around \n
    if @text.start_with? "* "
      snippet = @text[2..-1]
      parsedlist = "<li>#{snippet}</li>"
      return "<ul>
  #{parsedlist}
</ul>"
    end
    @text
  end

  def parse_ol_lists
    # needs to be rewritten to catch multiple elements of list - so each numbered line split around \n
    if @text[0].to_i > 0
      snippet = @text[3..-1]
      parsedlist = "<li>#{snippet}</li>"
      return "<ol>
  #{parsedlist}
</ol>"
    end
    @text
  end
end
