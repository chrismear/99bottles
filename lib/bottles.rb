# frozen_string_literal: true

# Returns the lyrics to a song about beer.
class Bottles
  def verse(verse_number)
    "#{bottles_of_beer(verse_number)} on the wall, " \
    "#{bottles_of_beer(verse_number)}.\n" \
    "Take #{indefinite_pronoun(verse_number)} down and pass it around, " \
    "#{bottles_of_beer(verse_number - 1)} on the wall.\n"
  end

  private

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
