# frozen_string_literal: true

# Returns the lyrics to a song about beer.
class Bottles
  def verses(from, to)
    from.downto(to).map do |verse_number|
      verse(verse_number)
    end.join("\n")
  end

  def verse(verse_number)
    next_number = decrement(verse_number)
    format_as_verse(
      "#{bottles_of_beer(verse_number)} on the wall, " \
      "#{bottles_of_beer(verse_number)}.",
      instruction(verse_number) +
      ", #{bottles_of_beer(next_number)} on the wall."
    )
  end

  private

  def format_as_verse(*lines)
    lines.map(&:capitalize).join("\n") + "\n"
  end

  def decrement(verse_number)
    next_number = verse_number - 1
    return 99 if next_number.negative?

    next_number
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
