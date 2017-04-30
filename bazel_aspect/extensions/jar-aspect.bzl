def _jar_aspect_impl(target, ctx):

    jars = " ".join([j.path for j in target.files])
    print("jars: ", jars)

    output = ctx.new_file("jars.txt")
    outputs = [output]

    ctx.file_action(
      output = output,
      content = jars,
    )

    return struct(output_groups = {"foobars" : set(outputs)})

jar_aspect = aspect(implementation = _jar_aspect_impl,
    attr_aspects = ["deps"]
)