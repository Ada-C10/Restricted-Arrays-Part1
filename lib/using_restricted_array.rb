require 'pry'
require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  array_length = 0
  while array[array_length] != nil
    array_length += 1
  end
  return array_length  # raise NotImplementedError
end

# Prints each integer values in the array
def print_array(array)

  array.length.times do |array_element|
    print "#{array_element} "
  end
  # raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  index = 0
  result = false
  while array[index] != nil do
    if array[index] == value_to_find
      result = true
    end
    index += 1
  end
  return result
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  index = 0
  largest = array[0]
  while array[index] != nil do
    if array[index] > largest
      largest = array[index]
    end
    index += 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  index = 0
  smallest = array[0]
  while array[index] != nil do
    if array[index] < smallest
      smallest = array[index]
    end
    index += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  beg_index = 0
  end_index = length - 1
  temp = 0
  number_of_swaps = length / 2
  number_of_swaps.times do
    temp = array[beg_index]
    array[beg_index] = array[end_index]
    array[end_index] = temp
    beg_index += 1
    end_index -= 1
    number_of_swaps += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  beg_index = 0
  end_index = length - 1
  while beg_index <= end_index do
    half = (end_index - beg_index) / 2
    if array[beg_index + half] == value_to_find
      return true
    elsif array[beg_index + half] < value_to_find
      beg_index = beg_index + half + 1
    else
      end_index = beg_index + half - 1
    end
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
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
