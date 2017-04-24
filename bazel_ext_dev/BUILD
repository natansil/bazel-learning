# # load('//:my-extensions/my-first-extension.bzl', 'greeting')

# # greeting()

# load('//:my-extensions/my-first-rule.bzl', 'my_rule')

# my_rule(name = 'whatever')

# load("//:my-extensions/output.bzl", "my_rule")

# # my_rule(name = 'whatever')
# my_rule(name = "foo", suffix = "txt")




load("//:my-extensions/fun-with-outputs.bzl", "my_rule")

my_rule(
    name = "foo",
    many_results = [
        "212",
        "917",
        "646",
    ],
    one_result = "brooklyn",
)



load('//:my-extensions/dark-underbelly.bzl', 'du')
du(name = "whatever")

load('//:my-extensions/very-dark-underbelly.bzl', 'vdu')
vdu(
    name = "dark-whatever", 
    one_result = "foo2"
)

load('//:my-extensions/thousand-outputs.bzl', 'thousand')
thousand(name = "natan")


# java_library(
#     name = "example",
#     srcs = ["src/main/java/com/example/Example.java"],
# )



# java_test(
#     name = "example_tests",
#     size = "small",
#     srcs = ["src/test/java/com/example/ExampleTest.java"],
#     deps = [
#         ":example",
#         "//third_party:junit4",
#     ],
#     test_class = "com.example.ExampleTest",
# )

