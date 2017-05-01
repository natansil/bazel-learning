bazel clean;

bazel build //m0/src/main/scala/com/example2:scala_example2 \
      --aspects extensions/jar-aspect.bzl%jar_aspect \
        --output_groups=foobars,default

bazel build //m0/src/main/scala/com/example:scala_example \
      --aspects extensions/jar-aspect.bzl%jar_aspect \
        --output_groups=foobars,default

bazel build //m0/src/main/scala/com/example:scala_example \
      --aspects extensions/srcs-aspect.bzl%srcs_aspect \
        --output_groups=srcs,default

bazel build //m0/src/test/scala/com/example:scala_example_test \
      --aspects extensions/srcs-aspect.bzl%srcs_aspect \
        --output_groups=srcs,default