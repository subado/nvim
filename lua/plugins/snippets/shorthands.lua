local ls = require('luasnip')

local M = {
  ls = ls,
  s = ls.snippet,
  sn = ls.snippet_node,
  t = ls.text_node,
  i = ls.insert_node,
  f = ls.function_node,
  c = ls.choice_node,
  d = ls.dynamic_node,
  r = ls.restore_node,
  l = require('luasnip.extras').lambda,
  rep = require('luasnip.extras').rep,
  p = require('luasnip.extras').partial,
  m = require('luasnip.extras').match,
  n = require('luasnip.extras').nonempty,
  dl = require('luasnip.extras').dynamic_lambda,
  fmt = require('luasnip.extras.fmt').fmt,
  fmta = require('luasnip.extras.fmt').fmta,
  types = require('luasnip.util.types'),
  conds = require('luasnip.extras.conditions'),
  conds_expand = require('luasnip.extras.conditions.expand')
}

return M
