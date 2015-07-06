# stackprof_wall_test

```
bundle install
bundle exec ruby test.rb
bundle exec stackprof profile.dump
```

In OSX you see this on the top:

```
==================================
  Mode: wall(1000)
  Samples: 7461 (0.00% miss rate)
  GC: 0 (0.00%)
==================================
     TOTAL    (pct)     SAMPLES    (pct)     FRAME
      7000  (93.8%)        7000  (93.8%)     Object#idle
```

But on ubuntu, I see :

```
==================================
  Mode: wall(1000)
  Samples: 6 (99.94% miss rate)
  GC: 0 (0.00%)
==================================
     TOTAL    (pct)     SAMPLES    (pct)     FRAME
         5  (83.3%)           5  (83.3%)     block in Object#find_many_square_roots
```

In OSX it detects the sleep operation as the most expensive one when using wall time, which is correct. But on linux, somehow many samples are lost (see miss rate) , and the sleep is not detected as the most expensive one.
