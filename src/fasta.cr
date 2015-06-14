# The Computer Language Benchmarks Game
# http://benchmarksgame.alioth.debian.org/
# Ruby version Contributed by Sokolov Yura
# Modified by Joseph LaFata
# Ported to Crystal by Wesley Moxam

$last = 42.0
IM=139968
IA=3877
IC=29573
def gen_random (max)
    (max * ($last = ($last * IA + IC) % IM)) / IM
end

alu =
   "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG"+
   "GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA"+
   "CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT"+
   "ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA"+
   "GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG"+
   "AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC"+
   "AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"

iub = {
  "a" => 0.27,
  "c" => 0.12,
  "g" => 0.12,
  "t" => 0.27,
  "B" => 0.02,
  "D" => 0.02,
  "H" => 0.02,
  "K" => 0.02,
  "M" => 0.02,
  "N" => 0.02,
  "R" => 0.02,
  "S" => 0.02,
  "V" => 0.02,
  "W" => 0.02,
  "Y" => 0.02
}

homosapiens = {
  "a" => 0.3029549426680,
  "c" => 0.1979883004921,
  "g" => 0.1975473066391,
  "t" => 0.3015094502008
}

def make_repeat_fasta(id, desc, src, n)
    puts ">#{id} #{desc}"
    l = src.length
    s = src * ((n / l) + 1)
    s = s[0, n] + s[l, -1]
    0.step(s.length-1,60) {|x| print s[x,60] , "\n"}
end

def make_random_fasta(id, desc, table, n)
    puts ">#{id} #{desc}"
    prob = 0.0
    table.each{|key, value| table[key] = (prob += value)}
    output = [] of String
    n.times do
      rand = gen_random(1.0)
      table.each do |key, value|
        if value > rand
          output << key
          break
        end
      end
    end
    0.step(output.length-1,60) {|x| print output[x,60].join , "\n"}
end


n = (ARGV[0] || 27).to_i

make_repeat_fasta("ONE", "Homo sapiens alu", alu, n*2)
make_random_fasta("TWO", "IUB ambiguity codes", iub, n*3)
make_random_fasta("THREE", "Homo sapiens frequency", homosapiens, n*5)
