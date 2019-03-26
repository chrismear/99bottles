# frozen_string_literal: true

# Returns the lyrics to a song about beer.
class Bottles
  def verse(verse_number)
    "#{bottles(verse_number)} on the wall, " \
    "#{bottles(verse_number)}.\n" \
    'Take one down and pass it around, ' \
    "#{bottles(verse_number - 1)} on the wall.\n"
  end

  private

  def bottles(number)
    if number == 1
      '1 bottle of beer'
    else
      "#{number} bottles of beer"
    end
  end
end
