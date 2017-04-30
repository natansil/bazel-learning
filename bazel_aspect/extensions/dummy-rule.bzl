def _rule_impl(ctx):
ctx.file_action(
      output = ctx.outputs.one_result,
      content = "I'm bespoke.",
  )

my_rule = rule(
    implementation = _rule_impl,  
    attrs = {'gav' : attr.string()},
    outputs = {'b' : 'b.%{suffix}'},
    # outputs = {'b' : '%{name}_b'}
)



