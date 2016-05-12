# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(self,root)
    return 0 if root.left == nil && root.right == nil
    return 1 + max(self.max_depth(root.left), self.max_depth(root.right))
end
