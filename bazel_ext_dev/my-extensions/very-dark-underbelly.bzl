def my_output(one_result):
  # One result is a label.
  first_char = one_result.name[0:1]
  return {'txt' : '%s.txt' % first_char}

def _impl(ctx):
  ctx.file_action(
      output = ctx.outputs.one_result,
      content = "I'm bespoke.",
  )
  ctx.file_action(
      output = ctx.outputs.txt,
      content = "I'm also bespoke.",
  )

vdu = rule(
  implementation = _impl, 
  attrs = {'one_result' : attr.output()},
  outputs = my_output,
)
