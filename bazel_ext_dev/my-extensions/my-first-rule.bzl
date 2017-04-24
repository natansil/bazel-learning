def _impl(ctx):
    print('my rule!!!')
    pass

my_rule = rule(
    implementation = _impl,
)
