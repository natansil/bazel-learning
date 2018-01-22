
def append(output, to):
  if output:
    to.append(output)

def _maybe_generate_compile_deps_file(target, ctx):
  if (hasattr(ctx.rule.attr, 'deps') and ctx.rule.attr.deps
    and ctx.rule.attr.testonly == False ):
    target_name = target.label.name

    deps = "\n".join([dep.label for dep in ctx.rule.attr.deps])

    deps_output = ctx.new_file("compile_deps_%s.txt" % target_name)

    ctx.file_action(
      output = deps_output,
      content = deps,
    )

    return deps_output
  else:
    return None

def _example_aspect_impl(target, ctx):
    # For every `src` in proto_library, generate an output file
    jars = target.files
    # outputs = [ctx.new_file(f.basename + ".FOO")
    #            for f in target.files]
    # print("\njava_common", java_common)

    # if hasattr(ctx.rule.attr, 'deps') and ctx.rule.attr.deps:
    #     print("\nctx.rule.attr.deps", ctx.rule.attr.deps)
    #     deps = []
    #     for dep in ctx.rule.attr.deps:
    #       if java_common.provider in dep:
    #         deps.append(dep[java_common.provider])
    #     print("\njava_common deps", deps)

  

    output = ctx.new_file("foo.txt")
    outputs = [output]

    ctx.file_action(
      output = output,
      content = "foo",
    )


    compile_deps_output = _maybe_generate_compile_deps_file(target, ctx)
    outputs.append(compile_deps_output)


    # if java_common.provider in target:
    #     print("target[java_common.provider].compile_jars", target[java_common.provider].compile_jars)

    # # print("\nctx.rule.attr", ctx.rule.attr)
    # if hasattr(ctx.rule.attr, 'java_common') and ctx.rule.attr.java_common:
    #     print("\nctx.rule.attr.java_common: ", ctx.rule.attr.java_common)

    # if hasattr(ctx.rule.attr, 'exports') and ctx.rule.attr.exports:
    #     names = ctx.rule.attr.exports[0].label
    # else:
    #     names = 'none'

    # baz = target.label
        

    # if hasattr(ctx.rule.attr, 'deps'):
    #     for dep in ctx.rule.attr.deps:
    #         print("target.label.name: ", target.label.name, " dep.foo ", dep.foo, " dep.baz ", dep.baz)
    #         # for file in dep.files:
    #         #     if file.path.startswith('external'):
    #         #         print("external label: %s" % (dep.label))







        # srcs = " ".join([f.path for dep in ctx.rule.attr.deps for files in dep.files])
        # print("%s: %s: %s" % (ctx.label, target.label.name , ctx.rule.attr.deps))


    # if hasattr(ctx.rule.files, 'srcs'):
    #     src = " ".join([src.path for src in ctx.rule.files.srcs])
    #     if src.startswith( 'external' ):
    #         print("%s: %s: %s" % (ctx.label, target.label.name , src))
    #     else:
    #         print("%s: %s: %s" % (ctx.label, target.label.name , "not external"))
    # else:
    #     print("%s: %s: %s" % (ctx.label, target.label.name , "no srcs"))
    # else:
    #     deps = "\n".join([dep.aspect_ids for dep in ctx.rule.attr.deps])
    #     print("deps: ", deps)

    # print("target ", target.label, "ctx.rule.attr.deps: ", ctx.rule.attr.deps)


    # print("\ntarget ", target)
    # print("\ntarget.files ", target.files)
    # print("\ntarget.files.to_list()[0].short_path ", target.files.to_list()[0].short_path)


    # print("\n")
    # print("outputs ", outputs)
    # print("outputs[0]", outputs[0])

    # print("outputs[0]", output)

    # ctx.action(
    #   outputs = outputs,
    #   command = "touch %s" % " ".join([p.path for p in outputs]),
    # )

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