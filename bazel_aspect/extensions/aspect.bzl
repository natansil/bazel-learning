def _example_aspect_impl(target, ctx):
    # For every `src` in proto_library, generate an output file
    jars = target.files
    # outputs = [ctx.new_file(f.basename + ".FOO")
    #            for f in target.files]

    print("ctx.rule: ", ctx.rule.attr.srcs[0].files)

    output = ctx.new_file("foo.bar")
    outputs = [output]
    # print("\ntarget ", target)
    # print("\ntarget.files ", target.files)
    # print("\ntarget.files.to_list()[0].short_path ", target.files.to_list()[0].short_path)


    # print("\n")
    # print("outputs ", outputs)
    # print("outputs[0]", outputs[0])

    print("outputs[0]", output)

    # ctx.action(
    #   outputs = outputs,
    #   command = "touch %s" % " ".join([p.path for p in outputs]),
    # )
    ctx.file_action(
      output = output,
      content = "I'm bespoke.",
    )
    # transitive_outputs = depset(outputs)
    # for dep in ctx.rule.attr.deps:
    #     transitive_outputs = transitive_outputs | dep.metal_proto.transitive_outputs
    # return struct(
    #     metal_proto = struct(direct_outputs = outputs,
    #                          transitive_outputs = transitive_outputs))


    # transitive_outputs = depset(outputs)
    # return struct(direct_outputs = outputs,
    #               transitive_outputs = transitive_outputs)
    return struct(output_groups = {"foobars" : set(outputs)})

example_aspect = aspect(implementation = _example_aspect_impl,
    attr_aspects = ["deps"]
)