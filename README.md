Crystal Computer Language Benchmark Game
========================================

Various CLBG (http://benchmarksgame.alioth.debian.org/) benchmarks in Crystal

To start the idea is to do a port of the Ruby benchmarks.

Targeting the HEAD version of Crystal

Status
------

(note: using Ruby 2.2.2 on Ubuntu, AMD Phenom(tm) II X3 720 Processor × 3)

Binarytrees:
  Ruby:     2m47.955s
  Crystal:  0m42.636s

Fannkuchredux:
  Ruby:     3m3.043s
  Crystal:  0m14.795s

Fasta:
  Ruby:     0m36.415s
  Crystal:  0m10.528s

Nbody:
  Ruby:     10m59.351s
  Crystal:  0m13.895s

Regexdna:
  Ruby:     0m13.484s
  Crystal:  0m13.367s

Running Benchmarks
------------------

Binary Trees:

    $ crystal build binarytrees.cr --release
    $ ./binarytrees 20
    stretch tree of depth 21	 check: -1
    2097152	 trees of depth 4	 check: -2097152
    524288	 trees of depth 6	 check: -524288
    131072	 trees of depth 8	 check: -131072
    32768	 trees of depth 10	 check: -32768
    8192	 trees of depth 12	 check: -8192
    2048	 trees of depth 14	 check: -2048
    512	 trees of depth 16	 check: -512
    128	 trees of depth 18	 check: -128
    32	 trees of depth 20	 check: -32
    long lived tree of depth 20	 check: -1
    $

Fannkuchredux:

    $ crystal build fannkuchredux.cr --release
    $ ./fannkuchredux 11
    556355
    Pfannkuchen(11) = 51
    $

Fasta:

    $ crystal build fasta.cr --release
    $ ./fasta 2500000
    >ONE Homo sapiens alu
    GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGA
    TCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACT
    AAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAG
    ...
    <tons of output>
    $

Nbody:

    $ crystal build nbody.cr --release
    $ ./nbody 50000000
    -0.169075164
    -0.169059907
    $

Regexdna:

    $ crystal build regexdna.cr --release
    $ ./regexdna < regexdna-input2500000.txt
    agggtaaa|tttaccct 0
    [cgt]gggtaaa|tttaccc[acg] 3
    a[act]ggtaaa|tttacc[agt]t 9
    ag[act]gtaaa|tttac[agt]ct 8
    agg[act]taaa|ttta[agt]cct 10
    aggg[acg]aaa|ttt[cgt]ccct 3
    agggt[cgt]aa|tt[acg]accct 4
    agggta[cgt]a|t[acg]taccct 3
    agggtaa[cgt]|[acg]ttaccct 5

    101745
    100000
    133640

    $
