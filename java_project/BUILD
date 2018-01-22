java_binary(
    name = "my-runner",
    srcs = glob(["**/*.java"]),
    main_class = "com.example.ProjectRunner",
    deps = [":greeter"],
    data = ["//:coordinates"],
    jvm_flags = ["-Dplugin.jar.location=$(location //:coordinates)"]
)

java_binary(
    name = "my-other-runner",
    srcs = ["src/main/java/com/example/ProjectRunner.java"],
    main_class = "com.example.ProjectRunner",
    deps = [":greeter"],
    jvm_flags = ["-Dplugin.jar.location=$(location :greeter)"]
)

java_library(
    name = "greeter",
    srcs = ["src/main/java/com/example/Greeting.java"],
    visibility = ["//src/main/java/com/example/cmdline:__pkg__"],
)

java_library(
    name = "A",
    srcs = ["src/main/java/com/example/A.java"],
    visibility = ["//src/main/java/com/example/cmdline:__pkg__"],
    deps = [":B"],
)

java_library(
    name = "B",
    srcs = ["src/main/java/com/example/B.java"],
    visibility = ["//src/main/java/com/example/cmdline:__pkg__"],
    deps = [":C"],
)

java_library(
    name = "C",
    srcs = ["src/main/java/com/example/C.java"],
    visibility = ["//src/main/java/com/example/cmdline:__pkg__"],
)

filegroup(
    name = "coordinates",
    srcs = ["MANIFEST.MF"],
)