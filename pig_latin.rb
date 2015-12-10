require 'pry'

class PigLatin
  attr_accessor :word, :first_consonants, :rest_of_word

  VOWELS = ['a', 'e', 'i', 'o', 'u']
  CONSONANTS = ['b']
  CODE_SOUND = 'ay'
  
  def initialize(word)
    @word = word
    @first_part_of_word = first_part_of_word
    @rest_of_word = rest_of_word
  end

  def check_vowel_start
    VOWELS.each do |vowel|
      return true if word.start_with?(vowel.to_s)
    end
  end

  def array_of_word
    word.chars
  end

  def index_of_first_vowel
    array_of_word.each do |letter|
        return array_of_word.index(letter.to_s) if VOWELS.include?(letter)
    end
  end

  def index_of_word_chop
    if word.include?('qu')
      index_of_first_vowel + 1
    elsif word.start_with?('y') && VOWELS.exclude?(array_of_word[1])
      index_of_first_vowel + 1
    else
      index_of_first_vowel
    end
  end

  def first_part_of_word
    @first_part_of_word = word[0..index_of_word_chop-1]
  end

  def rest_of_word
    @rest_of_word = array_of_word.drop(index_of_word_chop).join('')
  end

  def rearrange_word
    rest_of_word << first_part_of_word << CODE_SOUND
  end


  def self.translate(word)
    word_object = PigLatin.new(word)

    if word_object.check_vowel_start == true
      word << CODE_SOUND
    else
      word_object.rearrange_word
    end
  end
end