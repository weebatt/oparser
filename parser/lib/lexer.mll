{
  open Parser
  exception Error of string
}

(** Описание базовой грамматики языка Java *)

rule token = parse
  | [' ' '\t' '\n' '\r'] { token lexbuf }  (* Ignore whitespace *)
  | "//" [^'\n']* { token lexbuf }        (* Single-line comments *)
  | "/*" ([^'*'] | '*' [^'/'])* "*/" { token lexbuf }  (* Block comments *)

  (* Annotations *)
  | '@' { AT }

  (* Keywords *)
  | "class"              { CLASS }
  | "interface"          { INTERFACE }
  | "public"             { PUBLIC }
  | "private"            { PRIVATE }
  | "protected"          { PROTECTED }
  | "static"             { STATIC }
  | "abstract"           { ABSTRACT }
  | "final"              { FINAL }
  | "void"               { VOID }

  (* Symbols *)
  | '{'                  { LBRACE }
  | '}'                  { RBRACE }
  | '('                  { LPAREN }
  | ')'                  { RPAREN }
  | '['                  { LBRACKET }
  | ']'                  { RBRACKET }
  | ';'                  { SEMICOLON }
  | ','                  { COMMA }

  | ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as id { IDENTIFIER id }


  | '"' [^'"']* '"' { token lexbuf }

  | eof { EOF }

  | _ as char { raise (Error (Printf.sprintf "Unexpected character: %c" char)) }

{
  let token lexbuf = token lexbuf
}
