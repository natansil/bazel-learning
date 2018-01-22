def _jar_aspect_impl(target, ctx):
    target_name = target.label.name
    
    if target_name != 'copy_gav':
        outputs = process_valid_target(target, ctx)
    else:
        outputs = []

    return struct(output_groups = {"jars" : set(outputs)})

def process_valid_target(target, ctx):
    jar_output = generate_jar_file(target, ctx)
    target_output = generate_target_file(target, ctx)
 
    outputs = [jar_output, target_output]

    if hasattr(ctx.rule.attr, 'deps'):
        all_deps_output = generate_all_deps_file(target, ctx)
        outputs.append(all_deps_output)
        external_deps_output = generate_external_deps_file(target, ctx)
        outputs.append(external_deps_output)
        
    return outputs


def generate_jar_file(target, ctx):

    target_name = target.label.name

    jars = " ".join([j.path for j in target.files])
    print("jars: ", jars)

    output_file_name = generate_output_file_name(target_name, ctx.rule.attr.testonly)
    
    jar_output = ctx.new_file(output_file_name)

    ctx.file_action(
      output = jar_output,
      content = jars,
    )

    return jar_output


def generate_output_file_name(target_name, testonly):
    output_file_name = "_jars_%s.txt" % target_name

    if testonly:
        output_file_name = "test%s" % output_file_name
    else:
        output_file_name = "main%s" % output_file_name

    return output_file_name


def generate_target_file(target, ctx):
    target_name = target.label.name
 
    print("target: ", target.label)
    
    target_output = ctx.new_file("targets_%s.txt" % target_name)

    ctx.file_action(
      output = target_output,
      content = str(target.label),
    )

    return target_output


def generate_all_deps_file(target, ctx):
    target_name = target.label.name

    deps = "\n".join([dep.label for dep in ctx.rule.attr.deps])
    print("deps: ", deps)
    
    deps_output = ctx.new_file("all_deps_%s.txt" % target_name)

    ctx.file_action(
      output = deps_output,
      content = deps,
    )

    return deps_output

def generate_external_deps_file(target, ctx):
    target_name = target.label.name
    external_deps_list = []
    for dep in ctx.rule.attr.deps:
        for file in dep.files:
            if file.path.startswith('external'):
                external_dep = "%s"%dep.label
                external_deps_list.append(external_dep)
                print("external_dep: ", external_dep)
                
                
    external_deps = "\n".join(external_deps_list)            
    external_deps_output = ctx.new_file("external_deps_%s.txt" % target_name)

    ctx.file_action(
      output = external_deps_output,
      content = external_deps,
    )
    return external_deps_output




jar_aspect = aspect(implementation = _jar_aspect_impl,
    attr_aspects = ["deps"]
)