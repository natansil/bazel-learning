def my_output(hi):
  # One result is a label.
  # first_char = "a" #name[0:1]
  print(hi)
  sec_char = "b" #name[1:2]
  temp = 'a%{name}'
  first_char = hi.n[0:1]
  return {'1' : '%{name}.txt', '2' : '%s.txt' % sec_char}
  # return {'txt' : '%{name}.txt'}


def _impl(ctx):
  print(ctx.outputs)
  print(ctx.label)

  amount = len("hi")
  for key in range(1,amount + 1):
    ctx.file_action(
        output = getattr(ctx.outputs, "%d" % key),
        content = "I'm bespoke.",
    )
#   ctx.action(
#       outputs = [
# ctx.outputs.a, ctx.outputs.b
#     ],
#       command = "touch %s" % " ".join([p.path for p in [ctx.outputs.a, ctx.outputs.b]]),
#   )

thousand = rule(
  implementation = _impl, 
  # outputs = {'a' : 'bla', 'b':'bla2'},

  outputs = my_output({'n': '%{name}'}),
)