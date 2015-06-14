# The Computer Language Benchmarks Game
# http://benchmarksgame.alioth.debian.org
#
# Original Ruby version contributed by jose fco. gonzalez
# optimized & parallelized by Rick Branson
# Ported to Crystal by Wesley Moxam

seq = ""
while s = STDIN.gets
  seq += s
end

ilen = seq.size

seq = seq.gsub(/>.*\n|\n/,"")
clen = seq.length

MATCHERS = [
  /agggtaaa|tttaccct/,
  /[cgt]gggtaaa|tttaccc[acg]/,
  /a[act]ggtaaa|tttacc[agt]t/,
  /ag[act]gtaaa|tttac[agt]ct/,
  /agg[act]taaa|ttta[agt]cct/,
  /aggg[acg]aaa|ttt[cgt]ccct/,
  /agggt[cgt]aa|tt[acg]accct/,
  /agggta[cgt]a|t[acg]taccct/,
  /agggtaa[cgt]|[acg]ttaccct/
]

results = {} of Regex => String
threads = MATCHERS.map do |f|
  Thread.new do
    results[f] = "#{f.source} #{seq.scan(f).size}"
  end
end

threads.each do |t|
  t.join
end

MATCHERS.each do |t|
  puts results[t]
end

{
'B' => "(c|g|t)", 'D' => "(a|g|t)", 'H' => "(a|c|t)", 'K' => "(g|t)",
'M' => "(a|c)", 'N' => "(a|c|g|t)", 'R' => "(a|g)", 'S' => "(c|t)",
'V' => "(a|c|g)", 'W' => "(a|t)", 'Y' => "(c|t)"
}.each { |f,r| seq = seq.gsub(f,r) }

puts
puts ilen
puts clen
puts seq.length
