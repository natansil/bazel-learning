def my_output():
  return {'txt' : '%{name}.txt'}

def _impl(ctx):
  ctx.file_action(
      output = ctx.outputs.txt,
      content = "I'm bespoke.",
  )

du = rule(
  implementation = _impl, 
  outputs = my_output
)
