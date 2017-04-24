def _impl(ctx):
  ctx.file_action(
      output = ctx.outputs.one_result,
      content = "I'm bespoke.",
  )
  ctx.action(
      outputs = ctx.outputs.many_results,
      command = "touch %s" % " ".join([p.path for p in ctx.outputs.many_results]),
  )

my_rule = rule(
    implementation = _impl,
    attrs = {
        'one_result' : attr.output(),
        'many_results' : attr.output_list(),
    }
)