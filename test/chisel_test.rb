gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/chisel.rb'

class ChiselTest < Minitest::Test

  def test_it_parses_nothing
    chisel = Chisel.new("")
    output = chisel.split_and_parse
    assert_equal "", output
  end

  def test_it_parses_with_no_space_after_h1
    chisel = Chisel.new("#My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h1>My name is Sekhar.</h1>

", output
  end

  def test_it_parses_h1
    chisel = Chisel.new("# My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h1>My name is Sekhar.</h1>

", output
  end

  def test_it_parses_another_h1
    chisel = Chisel.new("# My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h1>My name is Blithe.</h1>

", output
  end

  def test_it_parses_h2
    chisel = Chisel.new("## My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h2>My name is Sekhar.</h2>

", output
  end

  def test_it_parses_another_h2
    chisel = Chisel.new("## My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h2>My name is Blithe.</h2>

", output
  end

  def test_it_parses_h3
    chisel = Chisel.new("### My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h3>My name is Sekhar.</h3>

", output
  end

  def test_it_parses_another_h3
    chisel = Chisel.new("### My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h3>My name is Blithe.</h3>

", output
  end

  def test_it_parses_h4
    chisel = Chisel.new("#### My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h4>My name is Sekhar.</h4>

", output
  end

  def test_it_parses_another_h4
    chisel = Chisel.new("#### My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h4>My name is Blithe.</h4>

", output
  end

  def test_it_parses_h5
    chisel = Chisel.new("##### My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h5>My name is Sekhar.</h5>

", output
  end

  def test_it_parses_another_h5
    chisel = Chisel.new("##### My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h5>My name is Blithe.</h5>

", output
  end

  def test_it_parses_with_no_space_after_h6
    chisel = Chisel.new("######My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h6>My name is Sekhar.</h6>

", output
  end

  def test_it_parses_h6
    chisel = Chisel.new("###### My name is Sekhar.")
    output = chisel.split_and_parse
    assert_equal "<h6>My name is Sekhar.</h6>

", output
  end

  def test_it_parses_another_h6
    chisel = Chisel.new("###### My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h6>My name is Blithe.</h6>

", output
  end

  def test_it_parses_multiple_hashtags
    chisel = Chisel.new("###### My name is # Blithe.")
    output = chisel.split_and_parse
    assert_equal "<h6>My name is # Blithe.</h6>

", output
  end

  def test_it_parses_one_paragraph
    chisel = Chisel.new("My name is Blithe.")
    output = chisel.split_and_parse
    assert_equal "<p>
  My name is Blithe.
</p>", output
  end

  def test_it_parses_one_paragraph_with_separate_lines
    chisel = Chisel.new("My name is Blithe.
I am really cool.")
    output = chisel.split_and_parse
    assert_equal "<p>
  My name is Blithe.
I am really cool.
</p>", output
  end

  def test_it_parses_two_paragraphs
    chisel = Chisel.new("My name is Josh Cheek.

I grow cacti.")
    output = chisel.split_and_parse
    assert_equal "<p>
  My name is Josh Cheek.
</p><p>
  I grow cacti.
</p>", output
  end

  def test_it_parses_emphasis
    chisel = Chisel.new("Josh Cheek *loves* kittens.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <em>loves</em> kittens.
</p>", output
  end

  def test_it_parses_multiple_emphasis
    chisel = Chisel.new("Josh Cheek *loves* *kittens*.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <em>loves</em> <em>kittens</em>.
</p>", output
  end

  def test_it_parses_emphasis_inside_strong
    chisel = Chisel.new("Josh Cheek ***loves* kittens**.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <strong><em>loves</em> kittens</strong>.
</p>", output
  end

  def test_it_parses_emphasis_inside__multiple_paragraphs
    chisel = Chisel.new("Josh Cheek *loves* kittens.

*Meow*.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <em>loves</em> kittens.
</p><p>
  <em>Meow</em>.
</p>", output
  end

  def test_it_parses_emphasis_inside_header_one
    chisel = Chisel.new("# Josh Cheek *loves* kittens.")
    output = chisel.split_and_parse
    assert_equal "<h1>Josh Cheek <em>loves</em> kittens.</h1>

", output
  end

  def test_it_parses_emphasis_inside_header_six
    chisel = Chisel.new("###### Josh Cheek *loves* kittens.")
    output = chisel.split_and_parse
    assert_equal "<h6>Josh Cheek <em>loves</em> kittens.</h6>

", output
  end

  def test_it_parses_emphasis_inside_ul_lists
    chisel = Chisel.new("* Josh Cheek *loves* kittens.")
    output = chisel.split_and_parse
    assert_equal "<ul>
  <li>Josh Cheek <em>loves</em> kittens.</li>
</ul>", output
  end

  def test_it_parses_emphasis_inside_ol_lists
    chisel = Chisel.new("1. Josh Cheek *loves* kittens.")
    output = chisel.split_and_parse
    assert_equal "<ol>
  <li>Josh Cheek <em>loves</em> kittens.</li>
</ol>", output
  end

  def test_it_parses_strong
    chisel = Chisel.new("Josh Cheek **loves** kittens.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <strong>loves</strong> kittens.
</p>", output
  end

  def test_it_parses_multiple_strong
    chisel = Chisel.new("Josh Cheek **loves** **kittens**.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <strong>loves</strong> <strong>kittens</strong>.
</p>", output
  end

  def test_it_parses_strong_inside_emphasis
    skip
    # need to refactor to do this if it's even possible
  end

  def test_it_parses_strong_inside_multiple_paragraphs
    chisel = Chisel.new("Josh Cheek **loves** kittens.

**Meow**.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Josh Cheek <strong>loves</strong> kittens.
</p><p>
  <strong>Meow</strong>.
</p>", output
  end

  def test_it_parses_strong_inside_header_one
    chisel = Chisel.new("# Josh Cheek **loves** kittens.")
    output = chisel.split_and_parse
    assert_equal "<h1>Josh Cheek <strong>loves</strong> kittens.</h1>

", output
  end

  def test_it_parses_strong_inside_header_six
    chisel = Chisel.new("###### Josh Cheek **loves** kittens.")
    output = chisel.split_and_parse
    assert_equal "<h6>Josh Cheek <strong>loves</strong> kittens.</h6>

", output
  end

  def test_it_parses_strong_inside_ul_lists
    chisel = Chisel.new("* Josh Cheek **loves** kittens.")
    output = chisel.split_and_parse
    assert_equal "<ul>
  <li>Josh Cheek <strong>loves</strong> kittens.</li>
</ul>", output
  end

  def test_it_parses_strong_inside_ol_lists
    chisel = Chisel.new("1. Josh Cheek **loves** kittens.")
    output = chisel.split_and_parse
    assert_equal "<ol>
  <li>Josh Cheek <strong>loves</strong> kittens.</li>
</ol>", output
  end

  def test_it_parses_ul_lists_one_element
    chisel = Chisel.new("* Adam Sandler sucks at acting.")
    output = chisel.split_and_parse
    assert_equal "<ul>
  <li>Adam Sandler sucks at acting.</li>
</ul>", output
  end

  def test_it_parses_ul_lists_two_elements
    skip
    # need to factor to catch multiple ul elements
    chisel = Chisel.new("* Adam Sandler sucks at acting.

* He used to be kind of funny.")
    output = chisel.split_and_parse
    assert_equal "<ul>
  <li>Adam Sandler sucks at acting.</li>
  <li>He used to be kind of funny.</li>
</ul>", output
  end

  def test_it_parses_ol_lists_one_element
    chisel = Chisel.new("1. Adam Sandler sucks at acting.")
    output = chisel.split_and_parse
    assert_equal "<ol>
  <li>Adam Sandler sucks at acting.</li>
</ol>", output
  end

  def test_it_parses_ol_lists_two_elements
    skip
    # need to refactor to catch multiple ol elements
    chisel = Chisel.new("1. Adam Sandler sucks at acting.

2. He used to be kind of funny.")
    output = chisel.split_and_parse
    assert_equal "<ol>
  <li>Adam Sandler sucks at acting.</li>
  <li>He used to be kind of funny.</li>
</ol>", output
  end


  def test_it_parses_ampersands
    chisel = Chisel.new("Hello & goodbye.")
    output = chisel.split_and_parse
    assert_equal "<p>
  Hello &amp; goodbye.
</p>", output
  end

end
