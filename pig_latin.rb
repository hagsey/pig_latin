require 'pry'

class PigLatin
  attr_accessor :word

  VOWELS = %w(a e i o u y)
  CODE_SOUND = 'ay'
  
  def initialize(word)
    @word = word
    @first_part_of_word = first_part_of_word
    @second_part_of_word = second_part_of_word
  end

  def array_of_word
    word.chars
  end

  def consonants
    letters = ('a'..'z').to_a
    letters.delete_if { |letter| VOWELS.include?(letter) }
  end

  def y_sounding_start
    word.start_with?('y') && VOWELS.include?(array_of_word[1])
  end

  def ex_sounding_start
    word.start_with?('x') && consonants.include?(array_of_word[1])
  end

  def qu_start
    word.include?('qu')
  end

  def check_vowel_sound_start
    if y_sounding_start
      return false
    else
      VOWELS.each do |vowel|
        return true if word.start_with?(vowel.to_s) || ex_sounding_start
      end
    end
  end

  def index_of_first_vowel_sound
    array_of_word.each do |letter|
      return array_of_word.index(letter.to_s) if VOWELS.include?(letter)
    end
  end

  def index_of_word_chop
    if qu_start
      index_of_first_vowel_sound + 1
    elsif y_sounding_start
      index_of_first_vowel_sound + 1
    else
      index_of_first_vowel_sound
    end
  end

  def first_part_of_word
    @first_part_of_word = word[0..index_of_word_chop - 1]
  end

  def second_part_of_word
    @second_part_of_word = array_of_word.drop(index_of_word_chop).join('')
  end

  def rearrange_word
    second_part_of_word << first_part_of_word
  end

  def self.translate(word)
    word_object = PigLatin.new(word)
    if word_object.check_vowel_sound_start == true
      word << CODE_SOUND
    else
      word_object.rearrange_word << CODE_SOUND
    end
  end
end
