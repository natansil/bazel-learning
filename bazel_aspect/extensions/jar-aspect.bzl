def _jar_aspect_impl(target, ctx):
    target_name = target.label.name
    print("target_name: ", target_name, " testOnly= ", ctx.rule.attr.testonly)

    if target_name != 'copy_gav':
        outputs = process_valid_target(target, ctx)
    else:
        outputs = []

    return struct(output_groups = {"jars" : set(outputs)})

def process_valid_target(target, ctx):
    target_name = target.label.name
    
    jars = " ".join([j.path for j in target.files])
    print("jars: ", jars)

    output_file_name = generate_output_file_name(target_name, ctx.rule.attr.testonly)
    
    output = ctx.new_file(output_file_name)
    outputs = [output]

    ctx.file_action(
      output = output,
      content = jars,
    )

    return outputs


def generate_output_file_name(target_name, testonly):
    output_file_name = "_jars_%s.txt" % target_name

    if testonly:
        output_file_name = "test%s" % output_file_name
    else:
        output_file_name = "main%s" % output_file_name

    return output_file_name



jar_aspect = aspect(implementation = _jar_aspect_impl,
    attr_aspects = ["deps"]
)