local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- HTML
ls.add_snippets("html", {
  s("class", {
    t('class="'), i(1), t('"')
  }),

  s("id", {
    t('id="'), i(1), t('"')
  })
})

-- JSX
ls.add_snippets("javascriptreact", {
  s("rfc", fmt([[
    import React from 'react';

    const {} = () => {{
      return (
        <>
          {}
        </>
      );
    }};

    export default {};
  ]], { i(1, "ComponentName"), i(2, "// content"), i(1) })),
})

-- TSX
ls.add_snippets("typescriptreact", {
  s("rfc", fmt([[
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
  ]], { i(1, "ComponentName"), i(1), i(1), i(2, "// content"), i(1) })),
})

-- Python
ls.add_snippets("python", {
  -- Function definition
  s("def", fmt([[
    def {}({}):
        {}
  ]], { i(1, "func_name"), i(2, "args"), i(3, "pass") })),

  -- Class definition with init
  s("class", fmt([[
    class {}:
        def __init__(self, {}):
            {}
  ]], { i(1, "ClassName"), i(2, "args"), i(3, "pass") })),

  -- If __name__ == '__main__':
  s("main", fmt([[
    if __name__ == "__main__":
        {}
  ]], { i(1, "main()") })),

  -- For loop
  s("for", fmt([[
    for {} in {}:
        {}
  ]], { i(1, "item"), i(2, "iterable"), i(3, "pass") })),

  -- While loop
  s("while", fmt([[
    while {}:
        {}
  ]], { i(1, "condition"), i(2, "pass") })),

  -- Try-except block
  s("try", fmt([[
    try:
        {}
    except {} as {}:
        {}
  ]], { i(1, "code"), i(2, "Exception"), i(3, "e"), i(4, "handle_exception") })),

  -- Print statement
  s("print", t("print()")),

  -- Import statement
  s("imp", fmt("import {}", { i(1, "module") })),

  -- Import from
  s("imf", fmt("from {} import {}", { i(1, "module"), i(2, "func") })),

  -- Lambda function
  s("lam", fmt("lambda {}: {}", { i(1, "args"), i(2, "expr") })),

  -- Return statement
  s("ret", fmt("return {}", { i(1, "") })),
})
