
(* The type of tokens. *)

type token = 
  | VOID
  | THROWS
  | STATIC
  | SEMICOLON
  | RPAREN
  | RBRACKET
  | RBRACE
  | PUBLIC
  | PROTECTED
  | PRIVATE
  | MAIN
  | LPAREN
  | LBRACKET
  | LBRACE
  | INT_LITERAL of (int)
  | INTERFACE
  | IDENTIFIER of (string)
  | FINAL
  | EOF
  | COMMA
  | CLASS
  | AT
  | ABSTRACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val compilation_unit: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.compilation_unit)
