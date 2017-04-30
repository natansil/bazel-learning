bazel clean;

bazel build //m0/src/main/scala/com/example2:scala_example2 \
      --aspects extensions/jar-aspect.bzl%jar_aspect \
        --output_groups=foobars,default

bazel build //m0/src/main/scala/com/example:scala_example \
      --aspects extensions/jar-aspect.bzl%jar_aspect \
        --output_groups=foobars,default