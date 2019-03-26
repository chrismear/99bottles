# frozen_string_literal: true

# Returns the lyrics to a song about beer.
class Bottles
  MAXIMUM_BOTTLES = 99

  def song
    verses(MAXIMUM_BOTTLES, 0)
  end

  def verses(from, to)
    from.downto(to).map do |verse_number|
      Verse.new(verse_number).lyrics
    end.join("\n")
  end

  def verse(number)
    Verse.new(number).lyrics
  end

  # One verse.
  class Verse
    attr_accessor :number

    def initialize(number)
      @number = number
    end

    def lyrics
      lines.map(&:capitalize).join("\n") + "\n"
    end

    private

    def next_number
      next_number = @number - 1
      return MAXIMUM_BOTTLES if next_number.negative?

      next_number
    end

    def lines
      [
        "#{bottles_of_beer(number)} on the wall, " \
        "#{bottles_of_beer(number)}.",
        instruction(number) +
          ", #{bottles_of_beer(next_number)} on the wall."
      ]
    end

    def instruction(verse_number)
      if verse_number.zero?
        'Go to the store and buy some more'
      else
        "Take #{indefinite_pronoun(verse_number)} down and pass it around"
      end
    end

    def bottles_of_beer(number)
      if number == 1
        '1 bottle of beer'
      elsif number.zero?
        'no more bottles of beer'
      else
        "#{number} bottles of beer"
      end
    end

    def indefinite_pronoun(number)
      if number == 1
        'it'
      else
        'one'
      end
    end
  end
end
