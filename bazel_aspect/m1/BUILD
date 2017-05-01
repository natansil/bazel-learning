genrule(
    name = "copy_gav",
    srcs = [
        "//m1:gav.txt",
    ],
    outs = ["gav1.txt"],
    cmd = "cp $(location //m1:gav.txt) $(@D)/gav1.txt",
)

genrule(
    name = "copy_gav2",
    srcs = [
        "//m1:gav.txt",
    ],
    outs = ["gav2.txt"],
    cmd = "cp $(location //m1:gav.txt) $(@D)/gav2.txt",
)