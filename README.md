Crystal Computer Language Benchmark Game
========================================

Various CLBG (http://benchmarksgame.alioth.debian.org/) benchmarks in Crystal

To start the idea is to do a port of the Ruby benchmarks.

Targeting the HEAD version of Crystal

Benchmarks
----------

Fannkuchredux:

    $ crystal build fannkuchredux.cr
    $ ./fannkuchredux 11
    556355
    Pfannkuchen(11) = 51
    $

Nbody:

    $ crystal build nbody.cr
    $ ./nbody 50000000
    -0.169075164
    -0.169059907
    $
