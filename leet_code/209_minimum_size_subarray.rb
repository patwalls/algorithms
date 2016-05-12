require 'byebug'

# For example, given the array [2,3,1,2,4,3] and s = 7,
# the subarray [4,3] has the minimal length under the problem constraint.

def min_sub_array_len(s, nums)
    # debugger
    nums.length.times do |window_size|
      (nums.length - window_size + 1).times do |window_start|
        window_arr = nums.slice(window_start,window_size + 1)
        return window_arr if window_arr.reduce(:+) == s
      end
    end
end

# start with window size of 1 and increment up


p min_sub_array_len(7,[2,3,1,2,4,3])
