#!/bin/bash

ALL=(
  benchmarks/1k_rows.rb \
  benchmarks/20k_rows.rb \
  benchmarks/auto_width.rb \
  benchmarks/memory.rb \
  benchmarks/profiler.rb \
  benchmarks/write_value.rb \
)

if [[ $# -gt 0 ]] ; then
  ALL=( "$@" )
fi

RUBY_BIN_VER="ruby-$(ruby --version | awk '{print $2}')"
for b in "${ALL[@]}" ; do
  echo "


Running benchmark $b
"
  ruby $b 2>&1 | tee ${b%.rb}-${RUBY_BIN_VER}.out
done
