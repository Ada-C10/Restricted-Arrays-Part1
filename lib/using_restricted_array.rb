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

class RestrictedArray
  # creates a restricted array of default size i.e. 20 or of size passed
  def initialize(*args)
    if args.size == 0 # no size argument passed, assume 20
      @array_size = 1 + rand(20)
    elsif args.size == 1 # create array of size passed
      @array_size = args[0]
    else # more than one argument passed - throw exception
      raise ArgumentError.new("More than 1 arguments passed. Expected 0 or 1 argument.")
    end

    # Composition used instead of Inheritance. Other methods of Array class will
    # not be accessible by consumers of RestrictedArray. Encapsulation allows us
    # to change internal workings later, without impacting other consumers of
    # this class.
    @internal_array = Array.new(@array_size){ |index| index + rand(1..200)}
  end
end

my_integer_array = RestrictedArray.new(9)

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

# Time Complexity
# O(n) - goes through entire array

# Space Complexity
# O(1) - Always returns one element regardless of size of input

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

# Time Complexity
# O(n) - Goes through entire array

# Space Complexity
# Would it be O(1)? Doesn't seem like memory is being used as we're just printing
# and we only have variable i

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

# Time Complexity
# O(n) - Has to go through entire array

# Space Complexity
# Would it be O(1)? The only element being created is i and it returns a boolean value regardless of size.

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

# Time Complexity
# O(n) - Checking entire array

# Space Complexity
# We create i and max no matter the size of the input
# Would it be O(1)?

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

# Time Complexity
# O(n)

# Space Complexity
# O(1)

# Reverses the values in the integer array in place
def reverse(array, length)
  if length == 0
    return nil
  end

  # Start at beginning of array with 0 index
  start = 0
  # End start value is at last value in array
  array_end = length - 1
  # While start is less than half of the length
  while start < length / 2
    # Begin at start of array
    temp = array[start]
    # Set start value = end value
    array[start] = array[array_end]
    # set end of array equal to temp
      # which in next loop will be
        # equal to start
    array[array_end] = temp
    array_end -= 1
    start += 1
  end
  return array
end

  # Time Complexity
  # Going through start to middle of array
  # 1/2 (O)
  # Drop the constant = O(n)?

  # Space Complexity
  # Variables created = start, array_end, temp.
  # Same three variables no matter the length of input
  # O(1)

  # Start i at 0
  # Start array_end at 1
  # Start at end of array (length - array end)
  # Add to beginning of new array i
  #
  # Increase i
  # Increase array end
  # Return new array

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  low = array[0]
  high = length - 1
  mid = (low + high) / 2
  while low <  high
    if value_to_find == mid
      return true
    elsif mid > value_to_find
      high = mid - 1
    else
      low = mid + 1
    end
  end
  if low == value_to_find
    return true
  else
    return false
  end
end

# Time Complexity
# Binary search - O(log n)

# Space Complexity
# We created low, high, and mid no matter the size of the input
# O(1)?

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

# Time Complexity
# Running for the length of the array O(n)
# Then we have a while loop for index < length O(n)
# So we have a loop of O(n) with a nested loop inside it = O(n^2)

# Space Complexity
# We create min_index, temp_index no matter the size of the input
# Would it be O(1)
