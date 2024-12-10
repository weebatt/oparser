{
  open Parser
  exception Error of string
}

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
  | "throws"             { THROWS }
  | "main"               { MAIN }

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

  | ['0'-'9']+ as num { INT_LITERAL (int_of_string num) }


  | '"' [^'"']* '"' { token lexbuf }

  | eof { EOF }

  (* Unexpected characters *)
  | _ as char { raise (Error (Printf.sprintf "Unexpected character: %c" char)) }

{
  let token lexbuf = token lexbuf
}
