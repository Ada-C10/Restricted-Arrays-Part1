require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0

  while array[0] != nil
    i += 1
  end
  return i
end

# Prints each integer values in the array
def print_array(array)
  print printed_array = array[0..-1]
end


# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  length.times do |index|
    if array[index] == value_to_find
      return "true"
    elsif
      return "false"
    end
  end
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  i = 0
  largest = array[0]

  while i < length
    if largest < array[i]
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

  while i < length
    if smallest > array[i]
      smallest = array[i]
    end
    i += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
def reverse(array, length)
  return if length < 2 # if length is 0 or 1, nothing to reverse
  front_index = 0
  back_index = length - 1
  while front_index < back_index
  # swap using temp variable
    temp = array[front_index]
    array[front_index] = array[back_index]
    array[back_index] = temp

    front_index += 1
    back_index -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  return false if length == 0
low = 0
high = length - 1
while low < high
  mid = (high + low)/2
  if array[mid] == value_to_find
    return true # value found
  elsif array[mid] > value_to_find
    high = mid - 1 # value is in the upper half
  elsif array[mid] < value_to_find
    low = mid + 1 # value is in the lower half
  end
end

return true if array[low] == value_to_find
return false # not found
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
    temp_index = index + 1 # compare with values at index+1 to length-1
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
