local ls = require 'luasnip'
local fmt = require('luasnip.extras.fmt').fmt

local s = ls.snippet
local i = ls.insert_node

return {
  s(
    'fn',
    fmt(
      [[fn {} ->
  {}
end]],
      {
        i(1, 'x'),
        i(2),
      }
    )
  ),
}
