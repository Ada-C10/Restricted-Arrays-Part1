require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# array = RestrictedArray.new
def length(array)
  # index number at array[0]
  length = 0
    while array[length] != nil
      length += 1
    end

  return length
end

# Prints each integer values in the array
def print_array(array)
  index = 0
  while index <= length
    puts array[index]
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  x = 0
  length.times do |x|
    if array[x] == value_to_find
      return true
    else
      x += 1
    end
  end
  return false
end
# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest_value = array[0]
  i = 0

  length.times do |i|
    if array[i] > largest_value
      largest_value = array[i]
    end
    i += 1
  end
  return largest_value

  # # sorted array
  # sort(array, length) = new_array
  # largest_value = new_array[-1]
end


# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  # unsorted array
  smallest_value = array[0]
  i = 0

  length.times do |i|
    if array[i] < smallest_value
      smallest_value = array[i]
    end
    i += 1
  end
  return smallest_value

  # # sorted array
  # sort(array, length) = new_array
  # smallest_value = new_array[0]
end

# Reverses the values in the integer array in place
def reverse(array, length)

  reversed_array = []

  i = 0
  length.times do |i|
    reversed_array << array[length - i]
    i += 1
  end

  return reversed_array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  i = length/2

  value = array[i]

  length.times do |i|
    length.times do |i|
      if array[i] == value_to_find
        return true
      else
        i += 1
      end
    end
    return false
  end
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
