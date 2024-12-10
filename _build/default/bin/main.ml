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

and class_decl_to_d3_json cls =
  `Assoc [
    ("name", `String (Printf.sprintf "Class: %s" cls.cl_name));
    ("children", `List (class_body_declaration_to_d3_json_list cls.cl_body))
  ]

and class_body_declaration_to_d3_json_list (ClassBody decls) =
  List.map class_body_declaration_to_d3_json decls

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

and interface_decl_to_d3_json iface =
  `Assoc [
    ("name", `String (Printf.sprintf "Interface: %s" iface.i_name));
    ("children", `List (interface_body_declaration_to_d3_json_list iface.i_body))
  ]

and interface_body_declaration_to_d3_json_list (InterfaceBody decls) =
  List.map interface_body_declaration_to_d3_json decls

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
