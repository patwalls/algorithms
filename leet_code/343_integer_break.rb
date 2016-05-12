require 'byebug'

INTEGER = []

def integer_break(n)
  integer_break_helper(n)
  INTEGER
end

def integer_break_helper(orig,accum=0,path=[])
  if accum == orig
    return path
  elsif accum > orig
    return []
  else
    
  end
end

p integer_break(3)
