def convert_to_bits(n)
  bits = [8,4,2,1]
  return_array = []
  remainder = n
  bits.each do |num|
    if remainder >= num
      return_array << 1
      remainder = remainder - num
    else
      return_array << 0
    end
  end
  return_array
end

def counting_bits(n)
  final_array = []
  (n + 1).times do |i|
    final_array << (i.to_s(2).split('').inject { |sum, n| sum.to_i + n.to_i }).to_i  
  end
  final_array
end

p counting_bits(5)
