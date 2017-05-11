require 'spec_helper'
require './lib/fizz_buzz'

describe FizzBuzz do
  describe '.play' do
    subject { FizzBuzz.new }

    it 'returns the number for input 1' do
      expect(subject.play(1)).to eq("1")
    end

    it 'returns Fizz for input 3' do
      expect(subject.play(3)).to eq("Fizz")
    end
  end
end
