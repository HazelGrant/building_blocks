# ##Your Task
# Implement a method #substring that takes a word as the first argument
# and then an array of valid substrings (your dictionary) as the second argument.
# It should return a hash listing each substring (case insensitive)
# that was found and how many times it was found.
# Next, make sure your method can handle multiple words.

def substrings(string, dictionary)
	string = sanitize(string)
	result = {}

	dictionary.each do |substring|
		count = string.scan(/#{substring}/).count

		if count != 0
			result.merge!(substring => count)
		end
	end

	result
end

def sanitize(string)
	check = string.downcase.split("")
	sanitized_string = ""

	check.each do |char|
		if char.between?("a","z")
			sanitized_string += char
		end
	end
	sanitized_string
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it",
				"i", "low", "own", "part", "partner", "sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)