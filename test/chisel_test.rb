gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './chisel.rb'

class ChiselTest < Minitest::Test

  def test_it_parses_nothing
    skip
  end

  def test_it_parses_with_no_space_after_h1
    skip
    # When there is no space after h1 syntax in Markdown input text, such as "#My name is..."
    # It should parse to "<h1> My name is..."
  end

  def test_it_parses_h1
    chisel = Chisel.new
    output = chisel.parse("# My name is Sekhar.")
    assert_equal "<h1>My name is Sekhar.</h1>", output
  end

  def test_it_parses_another_h1
    chisel = Chisel.new
    output = chisel.parse("# My name is Blithe.")
    assert_equal "<h1>My name is Blithe.</h1>", output
  end

  def test_it_parses_h2
    chisel = Chisel.new
    output = chisel.parse("## My name is Sekhar.")
    assert_equal "<h2>My name is Sekhar.</h2>", output
  end

  def test_it_parses_another_h2
    chisel = Chisel.new
    output = chisel.parse("## My name is Blithe.")
    assert_equal "<h2>My name is Blithe.</h2>", output
  end

  def test_it_parses_h3
    chisel = Chisel.new
    output = chisel.parse("### My name is Sekhar.")
    assert_equal "<h3>My name is Sekhar.</h3>", output
  end

  def test_it_parses_another_h3
    chisel = Chisel.new
    output = chisel.parse("### My name is Blithe.")
    assert_equal "<h3>My name is Blithe.</h3>", output
  end

  def test_it_parses_h4
    chisel = Chisel.new
    output = chisel.parse("#### My name is Sekhar.")
    assert_equal "<h4>My name is Sekhar.</h4>", output
  end

  def test_it_parses_another_h4
    chisel = Chisel.new
    output = chisel.parse("#### My name is Blithe.")
    assert_equal "<h4>My name is Blithe.</h4>", output
  end

  def test_it_parses_h5
    chisel = Chisel.new
    output = chisel.parse("##### My name is Sekhar.")
    assert_equal "<h5>My name is Sekhar.</h5>", output
  end

  def test_it_parses_another_h5
    chisel = Chisel.new
    output = chisel.parse("##### My name is Blithe.")
    assert_equal "<h5>My name is Blithe.</h5>", output
  end

  def test_it_parses_h6
    chisel = Chisel.new
    output = chisel.parse("###### My name is Sekhar.")
    assert_equal "<h6>My name is Sekhar.</h6>", output
  end

  def test_it_parses_another_h6
    chisel = Chisel.new
    output = chisel.parse("###### My name is Blithe.")
    assert_equal "<h6>My name is Blithe.</h6>", output
  end

  def test_it_parses_multiple_hashtags
    skip
    # It should be able to parse text with multiple #'s
  end

  def test_it_parses_one_paragraph
    chisel = Chisel.new
    output = chisel.parse("My name is Blithe.")
    assert_equal "<p>My name is Blithe.</p>", output
  end

  def test_it_parses_one_paragraph_with_separate_lines
    chisel = Chisel.new
    output = chisel.parse("My name is Blithe.
    I am really cool.")
    assert_equal "<p>My name is Blithe.
    I am really cool.</p>", output
  end

  def test_it_parses_two_paragraphs
    skip
    chisel = Chisel.new
    output = chisel.parse("My name is Josh Cheek.

    I grow cacti.")
    assert_equal "<p>My name is Josh Cheek.</p>
    <p>I grow cacti.</p>", output
  end

  # test for gigantic files with strings that make it overload

end
