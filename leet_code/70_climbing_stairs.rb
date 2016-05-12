# You are climbing a stair case. It takes n steps to reach to the top.
#
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

def climb_stairs(n,accum=0)
    return 0 if accum > n
    return 1 if accum == n
    climb_stairs(n,accum + 1) + climb_stairs(n,accum + 2)
end

p climb_stairs(35)

def climb_stairs(n)
    a = b = 1
    n.times { a, b = b, a+b }
    a
end
