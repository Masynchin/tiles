{ name = "my-project"
, dependencies =
  [ "arrays"
  , "effect"
  , "flame"
  , "foldable-traversable"
  , "lists"
  , "maybe"
  , "nonempty"
  , "prelude"
  , "test-unit"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
