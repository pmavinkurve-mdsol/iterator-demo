class Document
  include Enumerable

  attr_reader :author, :title, :content

  def initialize(title, author, content)
    @author = author
    @title = title
    @content = content
  end

  def words
    @content.split(' ')
  end

  def each_word
    return to_enum(:each_word) unless block_given?
    words.each { |word| yield word }
  end
  alias_method :each, :each_word

  def each_character
    @content.chars.each {|character| yield character }
  end

  def each_word_pair
    words[0..-2].each_with_index { |_, index| yield words[index], words[index + 1] }
  end
end