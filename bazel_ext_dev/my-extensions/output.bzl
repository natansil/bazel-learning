def _rule_impl(ctx):
  ctx.action(
    outputs = [ctx.outputs.b], 
    command = "touch a; touch %s" % ctx.outputs.b.path)

my_rule = rule(
    implementation = _rule_impl,  
    attrs = {'suffix' : attr.string()},
    outputs = {'b' : 'b.%{suffix}'},
    # outputs = {'b' : '%{name}_b'}
)
