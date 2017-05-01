def _srcs_aspect_impl(target, ctx):

    if hasattr(ctx.rule.attr, 'srcs'):
        srcs = " ".join([f.path for src in ctx.rule.attr.srcs for f in src.files])
    else:
        srcs = ""

    print("srcs: ", srcs)

    output = ctx.new_file("srcs.txt")
    outputs = [output]

    ctx.file_action(
      output = output,
      content = srcs,
    )

    return struct(output_groups = {"srcs" : set(outputs)})

srcs_aspect = aspect(implementation = _srcs_aspect_impl,
    attr_aspects = ["deps"]
)