class Formatting
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def parse_formatting
    twostarpairs = @text.scan("**").count/2
    while twostarpairs > 0
      @text.sub!("**", "<strong>")
      @text.sub!("**", "</strong>")
      twostarpairs -= 1
    end

    starpairs = @text.scan("*").count/2
    while starpairs > 0
      @text.sub!("*", "<em>")
      @text.sub!("*", "</em>")
      starpairs -= 1
    end

    @text
  end

  def parse_paragraphs
    if @text.start_with? "<ul>"
      @text
    elsif @text.start_with? "<ol>"
      @text
    elsif @text.start_with? "<h6>"
      @text
    elsif @text.start_with? "<h5>"
      @text
    elsif @text.start_with? "<h4>"
      @text
    elsif @text.start_with? "<h3>"
      @text
    elsif @text.start_with? "<h2>"
      @text
    elsif @text.start_with? "<h1>"
      @text
    else
      snippet = @text
      "<p>
  #{snippet}
</p>"
    end
  end

  def parse_ampersands
    ampersands = @text.scan("&").count
    while ampersands > 0
      @text.sub!("&", "&amp;")
      ampersands -= 1
    end
    @text
  end
end
