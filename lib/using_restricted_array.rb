require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  index = 0
  while array[index] != nil
    index += 1
  end
  return index
end

# Prints each integer values in the array
def print_array(array)
  x = 0
   while x < array.length
     print array[x]
     x += 1
   end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  length = length(array)
  x = 0
  while x < length
    if array[x] == value_to_find
      return true
    end
    x += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
    x = 0
    largest_value = array[0]

    while x < length
      if largest_value < array[x]
        largest_value = array[x]
      end
      x += 1
    end
    return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
    smallest_value = array[0]
    x = 0

    while x < length
      if smallest_value > array[x]
        smallest_value = array[x]
      end
      x += 1
    end
    return smallest_value
end

# Reverses the values in the integer array in place
def reverse(array, length)
  raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  # sorted_array = sort(array, length)
  high = length - 1
  low = 0
  mid = (high + low) / 2

  while low <= high
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
      mid = (high + low) / 2
    elsif array[mid] < value_to_find
      low = mid + 1
      mid = (high + low) / 2
    end
      # binding.pry
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
