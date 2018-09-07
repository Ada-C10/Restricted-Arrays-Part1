require 'pry'
require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  return nil if array[0] == nil
  i = 0
  until array[i] == nil
    i += 1
  end
  return i
  # raise NotImplementedError
end

# Prints each integer values in the array
def print_array(array)
  return nil if array[0] == nil
  if i != 0
    until array[i] == nil
      print array[i]
      i += 1
    end
  end
  # raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  return nil if array[0] == nil
  i = 0
  until array[i] == nil
    if value_to_find == array[i]
      return true
    end
    i += 1
  end
  return false
  # raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  return nil if array[0] == nil
  i = 0
  largest_value = array[0]
  until array[i] == nil
    if array[i] > largest_value
      largest_value = array[i]
    end
    i += 1
  end
  return largest_value
  # raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  return nil if array[0] == nil
  i = 0
  smallest_value = array[0]
  until array[i] == nil
    if array[i] < smallest_value
      smallest_value = array[i]
    end
    i += 1
  end
  return smallest_value
  # raise NotImplementedError
end

# Reverses the values in the integer array in place
def reverse(array, length)
  return nil if array[0] == nil
  i = 0
  j = length - 1

  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i += 1
    j -= 1
  end
  # binding.pry
  return array


  # raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  return nil if array[0] == nil
  low = array[0]
  high = array[length - 1]

  while low < high
    mid = (low + high) / 2
    if mid == value_to_find
      return true
    elsif mid > value_to_find
      high = mid - 1
    elsif mid < value_to_find
      low = mid + 1
    end

  end
  if low == value_to_find
    return true
  end
  return false
  # raise NotImplementedError
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
