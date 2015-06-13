Crystal Computer Language Benchmark Game
========================================

Various CLBG (http://benchmarksgame.alioth.debian.org/) benchmarks in Crystal

To start the idea is to do a port of the Ruby benchmarks.

Targeting the HEAD version of Crystal

Benchmarks
----------

* Fannkuchredux

    $ crystal build fannkuchredux.cr
    $ ./fannkuchredux 11
    556355
    Pfannkuchen(11) = 51
    $
