require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  length = 0
  20.times do |index|
    if array[index] == nil
      break
    else
      length += 1
    end
  end
  return length
end

# Prints each integer values in the array
def print_array(array)
  value = ""
  length(array).times do |index|
    value << array[index].to_s + " "
  end
  print value
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end
  return false
end



# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest_integer = 0
  length.times do |index|
    if array[index] > largest_integer
      largest_integer = array[index]
    end
  end
  return largest_integer
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest_integer = 222
  length.times do |index|
    if array[index] < smallest_integer
      smallest_integer = array[index]
    end
  end
  return smallest_integer
end

# Reverses the values in the integer array in place
def reverse(array, length)
  i = 0
  j = length(array) - 1

  while i < j do
      last = array[j]
      first = array[i]

      array[i] = last
      array[j] = first

      i += 1
      j -= 1
    end

    return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  i = 0
  j = length(array) - 1

  while i < j
    mid = (i + j) / 2

    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      j = mid - 1
    else
      i = mid + 1
    end
  end

  if array[i] == value_to_find
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
end
## --- END OF METHODS ---
