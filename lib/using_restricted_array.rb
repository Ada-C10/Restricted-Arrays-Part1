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

  index = 0
  statement = ""
  while array[index] != nil
    statement += "#{array[index]}\n"
    index += 1
  end

  return statement
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)

  # middle = length / 2
  #
  # until (low == length - 1)
  #   if array[middle] == value_to_find
  #     return true
  #   elsif array[middle] < value_to_find
  #     high = middle + 2
  #     low = middle
  #     middle = middle + 1
  #   elsif array[middle] > value_to_find
  #     low = middle
  #     high = middle - 2
  #     middle = middle - 1
  #   end
  # end

  index = 0

  while (index < length)
    if array[index] == value_to_find
      return true
    else
      index += 1
    end
  end

  return false

end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)


  max = 0
  index = 0

  while (index < length)
    if array[index] > max
      max = array[index]
    end
      index += 1
  end

  return max

end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)

  index = 0
  min = array[index]

  while (index < length)
    if array[index] < min
      min = array[index]
    end
      index += 1
  end

  return min

end

# Reverses the values in the integer array in place
def reverse(array, length)
  raise NotImplementedError

  # index = 0
  # statement = ""
  # while array[index] != nil
  #   statement += "#{array[index]}\n"
  #   index += 1
  # end
  #
  # return statement
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  raise NotImplementedError
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
