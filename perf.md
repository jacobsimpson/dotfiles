# How to perf


## Configure the kernel to generate detailed data

Without this one, there will be a lot of `unknown` methods in the call stack:

```
echo 0 |sudo tee /proc/sys/kernel/kptr_restrict
```

Without this one, there are errors when trying to gather data?

```
echo -1 | sudo tee /proc/sys/kernel/perf_event_paranoid
```

## Add debugging detail to the executable

These instructions are not necessary if you are working with the dev build.

For the `Cargo.toml` file:

```
# https://doc.rust-lang.org/cargo/reference/profiles.html
# dev, release, test, bench
[profile.dev]
# https://doc.rust-lang.org/cargo/reference/profiles.html#debug
debug = 2
```

## Gather some data

I've had some success with this line. It seems to generate quite a lot of data
(`-F 997` generates a _lot_ of data), which can make the flamegraph analysis
slow, however I do get stack frames from my code:

```
perf record --call-graph dwarf,16384 -e cpu-clock -F 49 -p <pid>
```

```
perf record --call-graph dwarf,16384 -e cpu-clock -F 49 <executable>
```

This one "works" to the extent it doesn't crash, and the data it produces
successfully generates a graph, however the graph appears to be missing all of
the stack frames from my code, so identifying performance problems is hard
because there is no context:

```
perf record -F 49 -ag -p 4000949
```

## Plot the data as a flamegraph

```
flamegraph --perfdata perf.data
```

## Perf for a benchmark

1. Compile the right kind of executable.

RUSTFLAGS="-g" cargo bench  --no-run

2. Find the compiled executable. List the executables in `release` or `debug`,
   depending on compile options. `benchmark_*` are the regular Rust benchmark
   executables, they are _not_ the Criterion executables.

   OR, when executing using `cargo bench`, the name of the executable is listed
   in the text output.

\ls -lhtr ./target/release/deps/<name-of-benchmark-file>_* \
        | grep -v "\.d"
BENCH=<selected-executable>

3. List the tests in the executable, to see what they are and pick one:

$BENCH --list

If none are listed, or the one you are looking for isn't present, you found the
wrong executable.

T_ID="sixtyfour_bits/bitter_byte_checked"

4. Use the discovered executable. This should produce normal test type output:

$BENCH --bench --profile-time 20 $T_ID

5. Generate performance data:

perf record --call-graph dwarf,16384 -e cpu-clock -F 49 $BENCH --bench --profile-time 20 $T_ID

This samples much more frequently, and produces a lot more data:

perf record --call-graph dwarf,16384 -e cpu-clock -F 997 $BENCH --bench --profile-time 20 $T_ID


## Valgrind

Untested instructions, however it seems that it is possible to use valgrind to
profile as well:

Have valgrind profile criterion running our benchmark for 10 seconds

valgrind --tool=callgrind \
         --dump-instr=yes \
         --collect-jumps=yes \
         --simulate-cache=yes \
         $BENCH --bench --profile-time 10 $T_ID

### Cachegrind

Untested.

Associated with valgrind, this mechanism determines the number of instructions
executed, rather than timing a lot of runs.

- https://valgrind.org/docs/manual/cg-manual.html
- https://github.com/bheisler/iai

## Alternative to Criterion

- https://nikolaivazquez.com/blog/divan/
- It appears that this framework is new enough it currently doesn't support
  `async` functions.

## Extra

- https://thume.ca/2023/12/02/tracing-methods/
- https://nickb.dev/blog/guidelines-on-benchmarking-and-rust/
    - how to profile a Rust benchmark using Valgrind
- https://github.com/llogiq/flamer
    - for putting marks in the code to flamegraph specific sections.
- https://www.worthe-it.co.za/blog/2018-09-23-performance-tuning-in-rust.html

## rr

There is a utility for recording execution and allowing replay debugging. It is
called `rr`.

I've had some success with:

```
rr record --bind-to-cpu=0 target/debug/deps/integration_tests-da6ece88dc1fed36
rr replay -d rust-gdb
```

And there is a [cheatsheet](https://gist.github.com/spacejam/15f27007c0b1bcc1d6b4c9169b18868c)
