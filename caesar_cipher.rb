# ##From Wikipedia:
#
# In cryptography, a Caesar cipher, also known as Caesar's cipher,
# the shift cipher, Caesar's code or Caesar shift, is one of the 
# implest and most widely known encryption techniques. It is a type of
# substitution cipher in which each letter in the plaintext is replaced
# by a letter some fixed number of positions down the alphabet. For example,
# with a left shift of 3, D would be replaced by A, E would become B, and so on.
# The method is named after Julius Caesar, who used it in his private correspondence.
#
# ##Your task:
#
# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:

def initialize
  @transfer = 0
end

def caesar_cipher(message, shift)
  alphabet = ("a".."z").to_a
  caps_alphabet = ("A".."Z").to_a
  result = ""
  break_message = message.split("")

  break_message.each do |character|
    if !character.between?("A","Z") && !character.between?("a","z")
      result += character
    elsif character.between?("A","Z")
      @transfer = caps_alphabet.index(character)
      @transfer = cipher(@transfer, shift)

      result += caps_alphabet[@transfer - 1]
    else
      @transfer = alphabet.index(character)
      @transfer = cipher(@transfer, shift)

      result += alphabet[@transfer - 1]
    end
  end

  puts result
end

def cipher(transfer, shift)
  transfer = transfer + shift + 1

  if transfer > 26
    transfer -= 26
  end
  transfer
end

caesar_cipher("What a string!", 5)

# => Bmfy f xywnsl!
