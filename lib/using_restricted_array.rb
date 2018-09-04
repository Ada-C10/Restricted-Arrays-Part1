require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

def length(array)
  i = 0
  while array[i] != nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
def print_array(array)
  i = 0
  while array[i] != nil
    print "#{array[i]}"
    i += 1
  end
  return i
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  while array[i] != nil
    if value_to_find == array[i]
      return true
    else
      i += 1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.

def find_largest(array, length)
  i = 0
  largest = array[0]
  until array[i] == nil
    if array[i] > largest
      largest = array[i]
    end
    i += 1
  end
  return largest
end


# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  i = 0
  smallest = array[0]
  while array[i] != nil
    if array[i] < smallest
      smallest = array[i]
    end
    i += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  # i = 0
  new_array = []
  new_index = nil
  i = 0
  while i < length
  # length.times do |i|
    new_index = (length) - (i + 1)
    new_array[new_index] = array[i]
    # binding.pry
    i += 1
  end
  new_array << new_array[new_index]
  binding.pry
  return new_array
end


# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# def binary_search(array, length, value_to_find)
#   i = 0
#   found = false
#   while found == false
#     if value_to_find == array[i]
#       found = true
#       return found
#     else
#       i += 1
#     end
#   end
#   return found
# # binding.pry
# end

def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1
  while low <= high
    mid = (low + high)/2
    if (array[mid]) > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
    else
      return true
    end
  end
  if array[low] == value_to_find
    return true
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
