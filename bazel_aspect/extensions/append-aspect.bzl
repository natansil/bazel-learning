def _append_aspect_impl(target, ctx):

    jars = " ".join([j.path for j in target.files])
    print("jars: ", jars)

    output_file_name = "jars.txt"
    output = ctx.new_file(output_file_name)
    outputs = [output]

    cmd = "touch %s; echo \"%s\" >> %s" % (output.path, jars, output.path)

    print("cmd: ", cmd)

    ctx.action(
    outputs = outputs,
    command = cmd,
    )

    return struct(output_groups = {"foobars" : set(outputs)})

append_aspect = aspect(implementation = _append_aspect_impl,
    attr_aspects = ["deps"]
)