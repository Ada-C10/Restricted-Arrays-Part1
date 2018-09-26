require_relative 'restricted_array.rb'
require "pry"
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  n = 0
  while array[n] != nil
    n+= 1
  end
  return n
end

# Prints each integer values in the array
def print_array(array)
  n = 0
  while array[n] != nil
    puts array[n]
    n+=1
  end
  return nil
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  n = 0
  while array[n] != nil
    if array[n] == value_to_find
      return true
    else
      n+=1
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  n = 1
  max = array[0]
  while array[n] != nil
    if array[n] > max
      max = array[n]
    end
    n += 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  n = 1
  max = array[0]
  while array[n] != nil
    if array[n] < max
      max = array[n]
    end
    n += 1
  end
  return max
end

# Reverses the values in the integer array in place
def reverse(array, length)
  i = 0
  j = length-1
  while i < j
    array[i] = array[i] + array[j]
    array[j] = array[i] - array [j]
    array[i] = array[i] - array[j]
    i += 1
    j -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  array = sort(array, length)
  low = 0
  high = length-1
  mid = (high - low) / 2
  while low < high
    if value_to_find == array[mid]
      return true
    elsif value_to_find < array[mid]
      high = mid
      mid = low + ((high - low)/2)
    elsif value_to_find > array[mid]
      low = mid
      mid = high - ((high - low) / 2)
    end
  end
  if value_to_find == array[mid]
    return true
  else
    return false
  end
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
  return array
end
## --- END OF METHODS ---

# length = 100
# p array = RestrictedArray.new(length)
# value_to_find = 1
# p binary_search(array, length, value_to_find)
