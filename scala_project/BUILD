load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_specs2_junit_test")

scala_library(
    name="scala_example",
    srcs=[
        "src/main/scala/com/example/Example.scala",
        ]
)

scala_specs2_junit_test(
    name = "scala_example_test",
    size = "small",
    srcs = ["src/test/scala/com/example/ExampleTest.scala"],
    deps = [":scala_example"],
    suffixes = ["Test"],
)