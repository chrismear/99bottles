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
        "#{bottle.bottles_of_beer} on the wall, " \
        "#{bottle.bottles_of_beer}.",
        bottle.instruction +
          ", #{next_bottle.bottles_of_beer} on the wall."
      ]
    end

    def bottle
      BottlesDescription.for(number)
    end

    def next_bottle
      BottlesDescription.for(next_number)
    end
  end

  # Words for no bottles.
  class ZeroBottleDescription
    def bottles_of_beer
      'no more bottles of beer'
    end

    def instruction
      'Go to the store and buy some more'
    end
  end

  # Words for a bottle.
  class OneBottleDescription < ZeroBottleDescription
    def bottles_of_beer
      '1 bottle of beer'
    end

    def instruction
      'Take it down and pass it around'
    end
  end

  # Words for bottles.
  class BottlesDescription < ZeroBottleDescription
    def self.for(number)
      case number
      when 0
        ZeroBottleDescription.new
      when 1
        OneBottleDescription.new
      else
        new(number)
      end
    end

    def initialize(number)
      @number = number
    end

    def bottles_of_beer
      "#{@number} bottles of beer"
    end

    def instruction
      'Take one down and pass it around'
    end
  end
end
