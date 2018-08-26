require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# Restricted-Array
# 1. Create an integer array of default size (i.e. 20) or of the size provided in the parameter.
#    All integer values are randomly initialized in the range of 1-221.
# 2. Get the value at a given index using `array[index]` format.
# 3. Update the value at a given index using `array[index]` format.
# None of the other methods available in the Ruby Array class are available in the RestrictedArray class.
#
# ## Exercise
# Implement the methods in using_restricted_array.rb. Methods to implement are:
# - *print_array* - which prints each integer value separated by space on the same line
# - *reverse* - which reverses the values in the array in place
# - *search* - which looks for a given integer value in the array. Returns true if found, false otherwise.
#              Note: do not assume that the array is sorted.
# - *binary_search* - which looks for a given integer value in the array. Returns true if found, false otherwise.
#              Note: Assume that the array is sorted in ascending order.
# - *find_largest* - Finds and returns the largest value element in the integer array.
# - *find_smallest* - Finds and returns the smallest value element in the integer array.


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
  # Setting iterator to start at 0
  i = 0

  # While i is < the length of the array
  while array[i] != nil
    # Print value if value is an integer
    print array[i] if array[i].class == Integer
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  while i < length
    if array[i] == value_to_find
      return true
    else
      return false
    end
    i += 1
  end
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  # If array is empty return nil
  if length == 0
    return nil
  end

  # Start i at 0
  i = 0
  # Start max at first element of array value
  max = array[0]
  # Compare each value to max
  while i < length
    # If greater than max, update max
    if array[i] > max
      max = array[i]
    end
    i += 1
  end
  return max
end


# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  # If array is empty return nil
  if length == 0
    return nil
  end

  # Start i at 0
  i = 0
  # Start min at first element of array value
  min = array[0]
  # Compare each value to min
  while i < length
    # If greater than min, update min
    if array[i] < min
      min = array[i]
    end
    i += 1
  end
  return min
end

# Reverses the values in the integer array in place
def reverse(array, length)
  raise NotImplementedError
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
