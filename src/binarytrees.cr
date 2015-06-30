# The Computer Language Benchmarks Game
# http://benchmarksgame.alioth.debian.org
#
# Original Ruby version contributed by Jesse Millikan
# Modified by Wesley Moxam
# Modified by Scott Leggett
# Ported to Crystal by Wesley Moxam

class Node
  property :item, :left, :right

  def initialize(item, left, right)
    @item = item
    @left = left
    @right = right
  end

  def item_check : Int32
    @item + (@left.try &.item_check).to_i - (@right.try &.item_check).to_i
  end
end

def bottom_up_tree(item, depth) : Node
  if depth > 0
    item_item = 2 * item
    depth -= 1
    Node.new item, bottom_up_tree(item_item - 1, depth), bottom_up_tree(item_item, depth)
  else
    Node.new item, nil, nil
  end
end

max_depth = ARGV[0].to_i
min_depth = 4

max_depth = [min_depth + 2, max_depth].max

stretch_depth = max_depth + 1
stretch_tree = bottom_up_tree(0, stretch_depth)

puts "stretch tree of depth #{stretch_depth}\t check: #{stretch_tree.item_check}"

long_lived_tree = bottom_up_tree(0, max_depth)

min_depth.step(max_depth + 1, 2) do |depth|
  iterations = 2**(max_depth - depth + min_depth)
  check = 0

  (1..iterations).each do |i|
    check += bottom_up_tree(i, depth).item_check
    check += bottom_up_tree(-i, depth).item_check
  end

  puts "#{iterations * 2}\t trees of depth #{depth}\t check: #{check}"
end

puts "long lived tree of depth #{max_depth}\t check: #{long_lived_tree.item_check}"
