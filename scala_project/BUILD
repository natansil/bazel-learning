load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_test")

scala_library(
    name="example",
    srcs=[
        "src/main/scala/com/example/Example.scala",
        ]
)

scala_test(
    name = "example_test",
    srcs = ["src/test/scala/com/example/ExampleTest.scala"],
    deps = [":example"],
)