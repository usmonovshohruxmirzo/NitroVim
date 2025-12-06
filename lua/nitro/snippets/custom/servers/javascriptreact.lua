local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("javascriptreact", {
  s(
    "rfc",
    fmt(
      [[
    import React from 'react';

    const {} = () => {{
      return (
        <>
          {}
        </>
      );
    }};

    export default {};
  ]],
      { i(1, "ComponentName"), i(2, "// content"), i(1) }
    )
  ),
})
