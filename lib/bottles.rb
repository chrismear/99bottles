# frozen_string_literal: true

# Returns the lyrics to a song about beer.
class Bottles
  def verse(verse_number)
    "#{verse_number} bottles of beer on the wall, " \
    "#{verse_number} bottles of beer.\n" \
    'Take one down and pass it around, ' \
    "#{verse_number - 1} bottles of beer on the wall.\n"
  end
end
