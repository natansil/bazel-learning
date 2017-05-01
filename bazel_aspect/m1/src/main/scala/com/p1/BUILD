load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")

scala_library(
    name="usage_example",
    srcs=[
        "UsageExample.scala",
        ],
    deps = ["//m0/src/main/scala/com/example:scala_example",
    "//m0/src/main/scala/com/example2:scala_example2"],
    # testonly = 1

)