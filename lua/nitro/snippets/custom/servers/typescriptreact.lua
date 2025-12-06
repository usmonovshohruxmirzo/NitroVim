local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("typescriptreact", {
  s(
    "rfc",
    fmt(
      [[
    import React from 'react';

    interface {}Props {{}}

    const {}: React.FC<{}Props> = () => {{
      return (
        <>
          {}
        </>
      );
    }};

    export default {};
  ]],
      { i(1, "ComponentName"), i(1), i(1), i(2, "// content"), i(1) }
    )
  ),
})
