require 'spec_helper'
require './lib/document'

describe Document do
  describe '.initialize' do
    it 'sets title correctly' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      document.title.should == 'Clean Code'
    end
  end

  describe '#words' do
    it 'returns the words from the document' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      document.send('words').size.should == 5
    end
  end

  describe '#each_word' do
    context 'with_block_given' do
      it 'prints each word on new line from the content' do
        document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
        count = 0
        document.each_word { |word| count += 1 }
        count.should == 5
      end
    end

    context 'without_block_given' do
      it 'returns an enumerable' do
        document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
        document.each_word.should be_a(Enumerable)
      end
    end
  end

  describe '#each_character' do
    it 'returns one character at a time' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      index = 0
      document.each_character { |character| index += 1 }
      index.should == 38
    end

    it 'works with an enumerator' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      enumerator = Enumerator.new(document, :each_character)
      enumerator.count.should == 38
    end
  end

  describe '#each_word_pair' do
    it 'returns one word pair at a time' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      count = 0
      document.each_word_pair { |first, second| count += 1}
      count.should == 4
    end

    it 'helps in finding a specific two-word pharse' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code')
      document.each_word_pair { |first, second| puts 'found the word pair' if first == 'readable' && second == 'code' }
    end
  end

  describe '#each' do
    it 'finds the count of words' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      count = 0
      document.each { |word| count += 1}
      count.should == 5
    end

    it 'evaluates include' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code.')
      document.include?('write')
    end

    it 'includes each_cons functionality' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code')
      document.each_cons(2) { |array| puts 'found word pair with each_cons' if array[0] == 'readable' && array[1] == 'code' }
    end

    it 'gives sorted list of words' do
      document = Document.new('Clean Code', 'Bob Martin', 'Developers should write readable code')
      document.sort.last.should == "write"
    end
  end
end
