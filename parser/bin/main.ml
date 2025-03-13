(* bin/main.ml *)

open Oparser
open Lexing
open Ast

(** 
    Преобразует AST в формат JSON для визуализации с помощью D3.js.
    @param ast Абстрактное синтаксическое дерево, представляющее компиляцию классов или интерфейсов.
    @return JSON-объект в формате D3.js.
*)
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

(** 
    Преобразует декларацию класса в JSON для D3.js.
    @param cls Структура, содержащая объявление класса.
    @return JSON-объект с именем класса и его телом.
*)
and class_decl_to_d3_json cls =
  `Assoc [
    ("name", `String (Printf.sprintf "Class: %s" cls.cl_name));
    ("children", `List (class_body_declaration_to_d3_json_list cls.cl_body))
  ]

(** 
    Преобразует список объявлений внутри тела класса в JSON.
    @param (ClassBody decls) Список объявлений (методов, конструкторов, полей и вложенных классов).
    @return Список JSON-объектов, представляющих каждое объявление.
*)
and class_body_declaration_to_d3_json_list (ClassBody decls) =
  List.map class_body_declaration_to_d3_json decls

(** 
    Преобразует одно объявление в теле класса в JSON.
    @param decl Объявление в теле класса, которое может быть методом, конструктором, полем, пустым объявлением или вложенным классом.
    @return JSON-объект, представляющий данное объявление.
*)
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

(** 
    Преобразует декларацию интерфейса в JSON для D3.js.
    @param iface Структура, содержащая объявление интерфейса.
    @return JSON-объект с именем интерфейса и его телом.
*)
and interface_decl_to_d3_json iface =
  `Assoc [
    ("name", `String (Printf.sprintf "Interface: %s" iface.i_name));
    ("children", `List (interface_body_declaration_to_d3_json_list iface.i_body))
  ]

(** 
    Преобразует список объявлений внутри тела интерфейса в JSON.
    @param (InterfaceBody decls) Список объявлений (методов и пустых объявлений).
    @return Список JSON-объектов, представляющих каждое объявление.
*)
and interface_body_declaration_to_d3_json_list (InterfaceBody decls) =
  List.map interface_body_declaration_to_d3_json decls

(** 
    Преобразует одно объявление в теле интерфейса в JSON.
    @param decl Объявление в теле интерфейса, которое может быть методом или пустым объявлением.
    @return JSON-объект, представляющий данное объявление.
*)
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

(** 
    Разбирает входной файл и строит абстрактное синтаксическое дерево (AST).
    @param filename Имя файла для разбора.
    @return AST, полученное после успешного разбора.
    @raise Lexer.Error Если произошла ошибка лексического анализа.
    @raise Parser.Error Если произошла ошибка синтаксического анализа.
*)
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

(** 
    Генерирует строку JSON для визуализации AST с помощью D3.js.
    @param ast Абстрактное синтаксическое дерево, полученное после разбора.
    @return Строка в формате JSON, отформатированная для удобства чтения.
*)
let generate_d3_json ast =
  ast_to_d3_json ast |> Yojson.Safe.pretty_to_string

(** 
    Основная функция программы.
    Обрабатывает аргументы командной строки, разбирает входной файл и сохраняет JSON-представление AST в указанный выходной файл.
    Если количество аргументов некорректно, выводит сообщение об использовании программы.
*)
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
