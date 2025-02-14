---
title: Documentation
---
# Introduction

This document will walk you through the implementation of a system that parses source files and converts their abstract syntax trees (AST) into a JSON format suitable for D3.js visualization.

The <SwmPath>[main](/main)</SwmPath> design decisions and questions covered include:

1. How is the AST converted into a JSON format?
2. How are different language constructs handled in the conversion process?
3. How is the parsing and JSON generation orchestrated?

# AST to JSON conversion

The core of the implementation is the conversion of the AST into a JSON format. This is achieved through recursive functions that traverse the AST and construct a JSON representation.

<SwmSnippet path="/bin/main.ml" line="1">

---

The <SwmToken path="/bin/main.ml" pos="8:4:4" line-data="let rec ast_to_d3_json ast =">`ast_to_d3_json`</SwmToken> function is the entry point for this conversion. It handles the top-level constructs of the AST, such as class and interface compilations, and delegates the conversion of their components to other functions.

```
(* bin/main.ml *)

open Oparser
open Lexing
open Ast


let rec ast_to_d3_json ast =
  match ast with
  | ClassCompilation classes ->
      `Assoc [
        ("name", `String "ClassCompilation");
        ("children", `List (List.map class_decl_to_d3_json classes))
      ]
  | InterfaceCompilation interfaces ->
      `Assoc [
        ("name", `String "InterfaceCompilation");
        ("children", `List (List.map interface_decl_to_d3_json interfaces))
      ]
```

---

</SwmSnippet>

# Class declarations conversion

<SwmSnippet path="/bin/main.ml" line="21">

---

Class declarations are converted to JSON by the <SwmToken path="/bin/main.ml" pos="21:2:2" line-data="and class_decl_to_d3_json cls =">`class_decl_to_d3_json`</SwmToken> function. It creates a JSON object for each class, including its name and body declarations.

```
and class_decl_to_d3_json cls =
  `Assoc [
    ("name", `String (Printf.sprintf "Class: %s" cls.cl_name));
    ("children", `List (class_body_declaration_to_d3_json_list cls.cl_body))
  ]

and class_body_declaration_to_d3_json_list (ClassBody decls) =
  List.map class_body_declaration_to_d3_json decls
```

---

</SwmSnippet>

<SwmSnippet path="/bin/main.ml" line="30">

---

The <SwmToken path="/bin/main.ml" pos="30:3:3" line-data="  and class_body_declaration_to_d3_json decl =">`class_body_declaration_to_d3_json`</SwmToken> function handles the conversion of individual class body declarations, such as methods, constructors, fields, and nested classes. Each declaration type is represented as a JSON object with a name and potentially children.

```
  and class_body_declaration_to_d3_json decl =
    match decl with
    | ClassMethodDecl m ->
        `Assoc [
          ("name", `String (Printf.sprintf "Method: %s" m.m_name));
          ("children", `List [])
        ]
    | ConstructorDecl c ->
        `Assoc [
          ("name", `String (Printf.sprintf "Constructor: %s" c.c_name));
          ("children", `List [])
        ]
    | FieldDecl f ->
        `Assoc [
          ("name", `String (Printf.sprintf "Field: %s %s" 
            (match f.f_type with TypeName tn -> tn | VoidType -> "void") f.f_name));
          ("children", `List [])
        ]
    | ClassEmptyDeclaration ->
        `Assoc [
          ("name", `String "EmptyDeclaration");
          ("children", `List [])
        ]
    | NestedClassDecl nested_cls -> 
        `Assoc [
          ("name", `String (Printf.sprintf "Nested Class: %s" nested_cls.cl_name));
          ("children", `List (class_body_declaration_to_d3_json_list nested_cls.cl_body))
        ]
```

---

</SwmSnippet>

# Interface declarations conversion

<SwmSnippet path="/bin/main.ml" line="59">

---

Similarly, interface declarations are converted using the <SwmToken path="/bin/main.ml" pos="59:2:2" line-data="and interface_decl_to_d3_json iface =">`interface_decl_to_d3_json`</SwmToken> function. It processes the interface name and its body declarations.

```
and interface_decl_to_d3_json iface =
  `Assoc [
    ("name", `String (Printf.sprintf "Interface: %s" iface.i_name));
    ("children", `List (interface_body_declaration_to_d3_json_list iface.i_body))
  ]

and interface_body_declaration_to_d3_json_list (InterfaceBody decls) =
  List.map interface_body_declaration_to_d3_json decls
```

---

</SwmSnippet>

<SwmSnippet path="/bin/main.ml" line="68">

---

The <SwmToken path="/bin/main.ml" pos="68:2:2" line-data="and interface_body_declaration_to_d3_json decl =">`interface_body_declaration_to_d3_json`</SwmToken> function deals with individual interface body declarations, such as methods, ensuring each is represented in the JSON format.

```
and interface_body_declaration_to_d3_json decl =
    match decl with
    | InterfaceMethodDecl m ->
        `Assoc [
          ("name", `String (Printf.sprintf "Method: %s" m.m_name));
          ("children", `List [])
        ]
    | InterfaceEmptyDeclaration ->
        `Assoc [
          ("name", `String "EmptyDeclaration");
          ("children", `List [])
        ]
let parse_file filename =
  let chan = open_in filename in
  let lexbuf = Lexing.from_channel chan in
  try
    let ast = Parser.compilation_unit Lexer.token lexbuf in
    Printf.printf "Parsed successfully!\n";
    ast
  with
  | Lexer.Error msg ->
      Printf.eprintf "Lexer error: %s\n" msg; exit 1
  | Parser.Error ->
      Printf.eprintf "Parser error at line %d, character %d\n"
        lexbuf.lex_curr_p.pos_lnum
        (lexbuf.lex_curr_p.pos_cnum - lexbuf.lex_curr_p.pos_bol); 
      exit 1
```

---

</SwmSnippet>

# Parsing and JSON generation orchestration

<SwmSnippet path="/bin/main.ml" line="68">

---

The <SwmToken path="/bin/main.ml" pos="80:2:2" line-data="let parse_file filename =">`parse_file`</SwmToken> function is responsible for reading a source file, lexing, and parsing it into an AST. It handles errors that may occur during lexing or parsing, providing informative messages.

```
and interface_body_declaration_to_d3_json decl =
    match decl with
    | InterfaceMethodDecl m ->
        `Assoc [
          ("name", `String (Printf.sprintf "Method: %s" m.m_name));
          ("children", `List [])
        ]
    | InterfaceEmptyDeclaration ->
        `Assoc [
          ("name", `String "EmptyDeclaration");
          ("children", `List [])
        ]
let parse_file filename =
  let chan = open_in filename in
  let lexbuf = Lexing.from_channel chan in
  try
    let ast = Parser.compilation_unit Lexer.token lexbuf in
    Printf.printf "Parsed successfully!\n";
    ast
  with
  | Lexer.Error msg ->
      Printf.eprintf "Lexer error: %s\n" msg; exit 1
  | Parser.Error ->
      Printf.eprintf "Parser error at line %d, character %d\n"
        lexbuf.lex_curr_p.pos_lnum
        (lexbuf.lex_curr_p.pos_cnum - lexbuf.lex_curr_p.pos_bol); 
      exit 1
```

---

</SwmSnippet>

<SwmSnippet path="/bin/main.ml" line="96">

---

Finally, the <SwmToken path="/_build/default/bin/main.ml" pos="96:2:2" line-data="let generate_d3_json ast =">`generate_d3_json`</SwmToken> function takes the parsed AST and converts it into a JSON string using the previously defined conversion functions. The <SwmPath>[main](/main)</SwmPath> execution block checks command-line arguments, parses the input file, generates the JSON, and writes it to the specified output file.

```
let generate_d3_json ast =
  ast_to_d3_json ast |> Yojson.Safe.pretty_to_string

let () =
  if Array.length Sys.argv <> 3 then
    Printf.eprintf "Usage: %s <filename> <output.json>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    let output_file = Sys.argv.(2) in
    let ast = parse_file filename in
    let json = generate_d3_json ast in
    let oc = open_out output_file in
    output_string oc json;
    close_out oc;
    Printf.printf "AST serialized to %s\n" output_file
```

---

</SwmSnippet>

This structure ensures that the system can efficiently parse and convert source files into a format that can be easily visualized using D3.js, providing a clear and organized representation of the code's structure.

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBb3BhcnNlciUzQSUzQXdlZWJhdHQ=" repo-name="oparser"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
