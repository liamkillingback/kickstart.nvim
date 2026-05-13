((call
  (identifier) @def_function.name
  (arguments)
  (do_block) @def_function.inner) @def_function.outer
  (#match? @def_function.name "^(def|defp)$"))
