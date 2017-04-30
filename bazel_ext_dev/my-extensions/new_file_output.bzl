def _rule_impl(ctx): 
  print("ctx.new_file(\"foo.bar\")", ctx.new_file("foo.bar"))
  print("ctx.outputs.b", ctx.outputs.b)

  output_file = ctx.new_file("foo.bar")

  command_string = "touch %s" % (output_file.path)

  print("command_string", command_string)
  ctx.action(
      outputs = [output_file],
      command = command_string,
  )

new_file_rule = rule(
    implementation = _rule_impl,  
    attrs = {'suffix' : attr.string()},
    # outputs = {'b' : 'b.%{suffix}'},
    outputs = {'b' : 'foo.bar'}
)
