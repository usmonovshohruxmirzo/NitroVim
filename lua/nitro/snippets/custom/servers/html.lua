local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- HTML
ls.add_snippets("html", {
  s("base", {
    t({ "<!DOCTYPE html>", '<html lang="en">', "<head>", '    <meta charset="UTF-8">', "    <title>" }),
    i(1, "Title"),
    t({ "</title>", "</head>", "<body>", "" }),
    i(2, "Content"),
    t({ "", "</body>", "</html>" }),
  }),

  -- Extends
  s("extends", {
    t("{% extends '"),
    i(1, "base.html"),
    t("' %}"),
  }),

  -- Block
  s("block", {
    t("{% block "),
    i(1, "block_name"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endblock " }),
    i(3, "block_name"),
    t(" %}"),
  }),

  -- URL tag
  s("url", {
    t("{% url '"),
    i(1, "view_name"),
    t("' %}"),
  }),

  -- Static files
  s("static", {
    t("{% static '"),
    i(1, "path/to/file"),
    t("' %}"),
  }),

  -- Load static
  s("loadstatic", {
    t("{% load static %}"),
  }),

  -- If condition
  s("if", {
    t("{% if "),
    i(1, "condition"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endif %}" }),
  }),

  -- If-Else
  s("ifelse", {
    t("{% if "),
    i(1, "condition"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content if true"),
    t({ "", "{% else %}", "" }),
    i(3, "Content if false"),
    t({ "", "{% endif %}" }),
  }),

  -- For loop
  s("for", {
    t("{% for "),
    i(1, "item in list"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endfor %}" }),
  }),

  -- Comment
  s("comment", {
    t("{# "),
    i(1, "Comment"),
    t(" #}"),
  }),

  -- Include template
  s("include", {
    t("{% include '"),
    i(1, "template.html"),
    t("' %}"),
  }),

  -- With statement
  s("with", {
    t("{% with "),
    i(1, "var=value"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endwith %}" }),
  }),

  -- Autoescape
  s("autoescape", {
    t("{% autoescape "),
    i(1, "on/off"),
    t(" %}"),
    t({ "", "" }),
    i(2, "Content"),
    t({ "", "{% endautoescape %}" }),
  }),

  -- csrf token
  s("csrf", {
    t("{% csrf_token %}"),
  }),

  -- Filter example
  s("filter", {
    t("{{ "),
    i(1, "variable"),
    t(" | "),
    i(2, "filter_name"),
    t(" }}"),
  }),
})
