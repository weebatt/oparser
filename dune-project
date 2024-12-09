(lang dune 3.16)
(using menhir 2.1)

(name oparser)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name oparser)
 (allow_empty)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml dune menhir)
 (tags
  (topics "to describe" "your project")))
