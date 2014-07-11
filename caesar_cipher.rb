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