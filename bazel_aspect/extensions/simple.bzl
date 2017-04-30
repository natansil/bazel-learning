def _simple_aspect_impl(target, ctx):

    output = ctx.new_file("foo.bar")
    outputs = [output]

    ctx.file_action(
      output = output,
      content = "I'm bespoke.",
    )

    return struct(output_groups = {"foobars" : set(outputs)})

simple_aspect = aspect(implementation = _simple_aspect_impl,
    attr_aspects = ["deps"]
)