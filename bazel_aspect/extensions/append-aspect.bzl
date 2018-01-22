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

def _append_aspect_impl(target, ctx):

    jars = " ".join([j.path for j in target.files])
    print("jars: ", jars)

    output_file_name = "%sjars.txt" % target.label.name
    output = ctx.new_file(output_file_name)
    outputs = [output]

    cmd = "touch %s; echo \"%s\" >> %s" % (output.path, jars, output.path)

    print("cmd: ", cmd)

    ctx.action(
    outputs = outputs,
    command = cmd,
    )

    compile_deps_output = _maybe_generate_compile_deps_file(target, ctx)
    if compile_deps_output:
      outputs.append(compile_deps_output)


    return struct(output_groups = {"foobars" : set(outputs)})

append_aspect = aspect(implementation = _append_aspect_impl,
    attr_aspects = ["deps"]
)