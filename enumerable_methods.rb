# ## Advanced Building Blocks - Project 2: Enumerable Methods
#
# You learned about the Enumerable module that gets mixed in to the Array
# and Hash classes (among others) and provides you with lots of handy iterator
# methods. To prove that there's no magic to it, you're going to rebuild those
# methods.
#
# 1. Create a script file to house your methods and run it in IRB to test them
# later.
#
# 2. Add your new methods onto the existing Enumerable module. Ruby makes this
# easy for you because any class or module can be added to without trouble.

module Enumerable

	# 3. Create #my_each, a method that is identical to #each but (obviously) does not
	# use #each. You'll need to remember the yield statement. Make sure it returns
	# the same thing as #each as well.

	def my_each
		return enum_for(:my_each) unless block_given?
		for element in self
			yield(element)
		end
		self
	end

	# 4. Create #my_each_with_index in the same way.

	def my_each_with_index
		return enum_for(:my_each_with_index) unless block_given?
		index = 0
		for element in self
			yield element, index
			index += 1
		end
		self
	end

	# 5. Create #my_select in the same way, though you may use #my_each in your definition
	# (but not #each).

	def my_select
		return enum_for(:my_select) unless block_given?
		copy = []

		for element in self
			if yield element
				copy.push(element)
			end
		end
		copy
	end

	# 6. Create #my_all? (continue as above)

	def my_all?
		return true if !block_given?
		value = true

		for element in self
			if !yield element
				value = false
			end
		end
		value
	end

	# 7. Create #my_any?

	def my_any?
		return true if !block_given?
		value = false

		for element in self
			if yield element
				value = true
			end
		end
		value
	end

	# 8. Create #my_none?

	def my_none?
		return false if !block_given?
		value = true

		for element in self
			if yield element
				value = false
			end
		end
		value
	end

	# 9. Create #my_count

	def my_count
		if !block_given?
			counter = 0
			for element in self
				counter += 1
			end
		else
			counter = 0
			for element in self
				if yield element
					counter += 1
				end
			end
		end
		counter
	end

	# 10. Create #my_map

	# 13. Modify your #my_map method to take a proc instead

	# 14. Modify your #my_map method to take either a proc or a block, executing
	# the block only if both are supplied (in which case it would execute both the
	# block AND the proc)

	def my_map(proc=nil)
		new_array = []
		if proc && block_given?
			self.my_each { |element| new_array << proc.call(yield(element)) }
			new_array
		elsif proc && !block_given?
			self.my_each { |element| new_array << proc.call(element) }
			new_array
		elsif proc.nil? && block_given?
			self.my_each { |element| new_array << yield(element) }
			new_array
		else
			enum_for(:my_map)
		end
	end

	# 11. Create #my_inject

	def my_inject(init_num=0)
		return enum_for(:my_inject) unless block_given?
		total = init_num

		self.my_each { |element| total = (yield(total, element)) }
		total
	end
end

# 12. Test your #my_inject by creating a method called #multiply_els which
# multiplies all the elements of the array together by using #my_inject,
# e.g. multiply_els([2,4,6]) #=> 48

def multiply_els(array)
	array.my_inject(1) { |product, num| product * num }
end