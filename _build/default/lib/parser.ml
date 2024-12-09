
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | INT_LITERAL of (
# 11 "lib/parser.mly"
       (int)
# 29 "lib/parser.ml"
  )
    | INTERFACE
    | IDENTIFIER of (
# 10 "lib/parser.mly"
       (string)
# 35 "lib/parser.ml"
  )
    | FINAL
    | EOF
    | COMMA
    | CLASS
    | AT
    | ABSTRACT
  
end

include MenhirBasics

# 3 "lib/parser.mly"
  
  open Ast

# 52 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_compilation_unit) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: compilation_unit. *)

  | MenhirState05 : (('s, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration, _menhir_box_compilation_unit) _menhir_state
    (** State 05.
        Stack shape : interface_declaration.
        Start symbol: compilation_unit. *)

  | MenhirState07 : ((('s, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_state
    (** State 07.
        Stack shape : interface_declaration annotations.
        Start symbol: compilation_unit. *)

  | MenhirState14 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_state
    (** State 14.
        Stack shape : interface_declaration annotations modifiers.
        Start symbol: compilation_unit. *)

  | MenhirState17 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_INTERFACE _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_state
    (** State 17.
        Stack shape : annotations modifiers INTERFACE IDENTIFIER.
        Start symbol: compilation_unit. *)

  | MenhirState22 : (('s, _menhir_box_compilation_unit) _menhir_cell1_interface_body_declaration, _menhir_box_compilation_unit) _menhir_state
    (** State 22.
        Stack shape : interface_body_declaration.
        Start symbol: compilation_unit. *)

  | MenhirState24 : (('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_state
    (** State 24.
        Stack shape : annotations.
        Start symbol: compilation_unit. *)

  | MenhirState25 : ((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_state
    (** State 25.
        Stack shape : annotations modifiers.
        Start symbol: compilation_unit. *)

  | MenhirState31 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_type_or_void _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_state
    (** State 31.
        Stack shape : annotations modifiers type_or_void IDENTIFIER.
        Start symbol: compilation_unit. *)

  | MenhirState40 : ((((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_type_or_void _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters, _menhir_box_compilation_unit) _menhir_state
    (** State 40.
        Stack shape : annotations modifiers type_or_void IDENTIFIER formal_parameters.
        Start symbol: compilation_unit. *)

  | MenhirState41 : (('s, _menhir_box_compilation_unit) _menhir_cell1_LBRACE, _menhir_box_compilation_unit) _menhir_state
    (** State 41.
        Stack shape : LBRACE.
        Start symbol: compilation_unit. *)

  | MenhirState49 : (('s, _menhir_box_compilation_unit) _menhir_cell1_formal_parameter, _menhir_box_compilation_unit) _menhir_state
    (** State 49.
        Stack shape : formal_parameter.
        Start symbol: compilation_unit. *)

  | MenhirState51 : (('s, _menhir_box_compilation_unit) _menhir_cell1_modifier, _menhir_box_compilation_unit) _menhir_state
    (** State 51.
        Stack shape : modifier.
        Start symbol: compilation_unit. *)

  | MenhirState53 : (('s, _menhir_box_compilation_unit) _menhir_cell1_annotation, _menhir_box_compilation_unit) _menhir_state
    (** State 53.
        Stack shape : annotation.
        Start symbol: compilation_unit. *)

  | MenhirState59 : (('s, _menhir_box_compilation_unit) _menhir_cell1_class_declaration, _menhir_box_compilation_unit) _menhir_state
    (** State 59.
        Stack shape : class_declaration.
        Start symbol: compilation_unit. *)

  | MenhirState61 : ((('s, _menhir_box_compilation_unit) _menhir_cell1_class_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_state
    (** State 61.
        Stack shape : class_declaration annotations.
        Start symbol: compilation_unit. *)

  | MenhirState62 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_class_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_state
    (** State 62.
        Stack shape : class_declaration annotations modifiers.
        Start symbol: compilation_unit. *)

  | MenhirState65 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_CLASS _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_state
    (** State 65.
        Stack shape : annotations modifiers CLASS IDENTIFIER.
        Start symbol: compilation_unit. *)

  | MenhirState73 : (('s, _menhir_box_compilation_unit) _menhir_cell1_class_body_declaration, _menhir_box_compilation_unit) _menhir_state
    (** State 73.
        Stack shape : class_body_declaration.
        Start symbol: compilation_unit. *)

  | MenhirState75 : (('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_state
    (** State 75.
        Stack shape : annotations.
        Start symbol: compilation_unit. *)

  | MenhirState76 : ((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_state
    (** State 76.
        Stack shape : annotations modifiers.
        Start symbol: compilation_unit. *)

  | MenhirState78 : (((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_IDENTIFIER, _menhir_box_compilation_unit) _menhir_state
    (** State 78.
        Stack shape : annotations modifiers IDENTIFIER.
        Start symbol: compilation_unit. *)

  | MenhirState82 : ((((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters, _menhir_box_compilation_unit) _menhir_state
    (** State 82.
        Stack shape : annotations modifiers IDENTIFIER formal_parameters.
        Start symbol: compilation_unit. *)

  | MenhirState90 : (('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_state
    (** State 90.
        Stack shape : annotations.
        Start symbol: compilation_unit. *)

  | MenhirState91 : ((('s, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_state
    (** State 91.
        Stack shape : annotations modifiers.
        Start symbol: compilation_unit. *)


and ('s, 'r) _menhir_cell1_annotation = 
  | MenhirCell1_annotation of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_annotations = 
  | MenhirCell1_annotations of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_class_body_declaration = 
  | MenhirCell1_class_body_declaration of 's * ('s, 'r) _menhir_state * (Ast.class_body_declaration)

and ('s, 'r) _menhir_cell1_class_declaration = 
  | MenhirCell1_class_declaration of 's * ('s, 'r) _menhir_state * (Ast.class_decl)

and ('s, 'r) _menhir_cell1_formal_parameter = 
  | MenhirCell1_formal_parameter of 's * ('s, 'r) _menhir_state * (Ast.param)

and ('s, 'r) _menhir_cell1_formal_parameters = 
  | MenhirCell1_formal_parameters of 's * ('s, 'r) _menhir_state * (Ast.param list)

and ('s, 'r) _menhir_cell1_interface_body_declaration = 
  | MenhirCell1_interface_body_declaration of 's * ('s, 'r) _menhir_state * (Ast.interface_body_declaration)

and ('s, 'r) _menhir_cell1_interface_declaration = 
  | MenhirCell1_interface_declaration of 's * ('s, 'r) _menhir_state * (Ast.interface_decl)

and ('s, 'r) _menhir_cell1_modifier = 
  | MenhirCell1_modifier of 's * ('s, 'r) _menhir_state * (string)

and ('s, 'r) _menhir_cell1_modifiers = 
  | MenhirCell1_modifiers of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_type_or_void = 
  | MenhirCell1_type_or_void of 's * ('s, 'r) _menhir_state * (Ast.type_type)

and ('s, 'r) _menhir_cell1_CLASS = 
  | MenhirCell1_CLASS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 10 "lib/parser.mly"
       (string)
# 221 "lib/parser.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 10 "lib/parser.mly"
       (string)
# 228 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_INTERFACE = 
  | MenhirCell1_INTERFACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state

and _menhir_box_compilation_unit = 
  | MenhirBox_compilation_unit of (Ast.compilation_unit) [@@unboxed]

let _menhir_action_01 =
  fun _2 ->
    (
# 148 "lib/parser.mly"
                  ( _2 )
# 245 "lib/parser.ml"
     : (string))

let _menhir_action_02 =
  fun _1 _2 ->
    (
# 143 "lib/parser.mly"
                           ( _1 :: _2 )
# 253 "lib/parser.ml"
     : (string list))

let _menhir_action_03 =
  fun _1 ->
    (
# 144 "lib/parser.mly"
               ( [_1] )
# 261 "lib/parser.ml"
     : (string list))

let _menhir_action_04 =
  fun () ->
    (
# 145 "lib/parser.mly"
                ( [] )
# 269 "lib/parser.ml"
     : (string list))

let _menhir_action_05 =
  fun () ->
    (
# 110 "lib/parser.mly"
                             ( () )
# 277 "lib/parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 111 "lib/parser.mly"
                ( () )
# 285 "lib/parser.ml"
     : (unit))

let _menhir_action_07 =
  fun _2 ->
    (
# 48 "lib/parser.mly"
                                          ( ClassBody(_2) )
# 293 "lib/parser.ml"
     : (Ast.class_body))

let _menhir_action_08 =
  fun _1 ->
    (
# 55 "lib/parser.mly"
                       ( ClassMethodDecl(_1) )
# 301 "lib/parser.ml"
     : (Ast.class_body_declaration))

let _menhir_action_09 =
  fun _1 ->
    (
# 56 "lib/parser.mly"
                            ( ConstructorDecl(_1) )
# 309 "lib/parser.ml"
     : (Ast.class_body_declaration))

let _menhir_action_10 =
  fun _1 ->
    (
# 57 "lib/parser.mly"
                      ( FieldDecl(_1) )
# 317 "lib/parser.ml"
     : (Ast.class_body_declaration))

let _menhir_action_11 =
  fun _1 ->
    (
# 58 "lib/parser.mly"
                      ( NestedClassDecl(_1) )
# 325 "lib/parser.ml"
     : (Ast.class_body_declaration))

let _menhir_action_12 =
  fun () ->
    (
# 59 "lib/parser.mly"
              ( ClassEmptyDeclaration )
# 333 "lib/parser.ml"
     : (Ast.class_body_declaration))

let _menhir_action_13 =
  fun _1 _2 ->
    (
# 51 "lib/parser.mly"
                                                   ( _1 :: _2 )
# 341 "lib/parser.ml"
     : (Ast.class_body_declaration list))

let _menhir_action_14 =
  fun () ->
    (
# 52 "lib/parser.mly"
                ( [] )
# 349 "lib/parser.ml"
     : (Ast.class_body_declaration list))

let _menhir_action_15 =
  fun _1 _2 _4 _5 ->
    (
# 31 "lib/parser.mly"
    (
      { cl_annotations = _1;
        cl_modifiers = _2;
        cl_name = _4; 
        cl_body = _5; }
    )
# 362 "lib/parser.ml"
     : (Ast.class_decl))

let _menhir_action_16 =
  fun _1 _2 ->
    (
# 22 "lib/parser.mly"
                                             ( _1 :: _2 )
# 370 "lib/parser.ml"
     : (Ast.class_decl list))

let _menhir_action_17 =
  fun _1 ->
    (
# 23 "lib/parser.mly"
                      ( [_1] )
# 378 "lib/parser.ml"
     : (Ast.class_decl list))

let _menhir_action_18 =
  fun _1 ->
    (
# 18 "lib/parser.mly"
                               ( ClassCompilation(_1) )
# 386 "lib/parser.ml"
     : (Ast.compilation_unit))

let _menhir_action_19 =
  fun _1 ->
    (
# 19 "lib/parser.mly"
                                   ( InterfaceCompilation(_1) )
# 394 "lib/parser.ml"
     : (Ast.compilation_unit))

let _menhir_action_20 =
  fun () ->
    (
# 120 "lib/parser.mly"
                             ( Block )
# 402 "lib/parser.ml"
     : (Ast.block))

let _menhir_action_21 =
  fun () ->
    (
# 121 "lib/parser.mly"
              ( EmptyBlock )
# 410 "lib/parser.ml"
     : (Ast.block))

let _menhir_action_22 =
  fun _1 _2 _3 _5 _7 ->
    (
# 87 "lib/parser.mly"
    (
      {
        c_annotations = _1;
        c_modifiers = _2;
        c_name = _3; 
        c_params = _5;
        c_body = _7;   (* Всегда Block или EmptyBlock *)
      }
    )
# 426 "lib/parser.ml"
     : (Ast.constructor_decl))

let _menhir_action_23 =
  fun _1 _2 _3 _4 ->
    (
# 99 "lib/parser.mly"
    (
      {
        f_annotations = _1;
        f_modifiers = _2;
        f_type = _3;
        f_name = _4;
      }
    )
# 441 "lib/parser.ml"
     : (Ast.field_decl))

let _menhir_action_24 =
  fun _1 _2 ->
    (
# 132 "lib/parser.mly"
                         ( Param(_1, _2) )
# 449 "lib/parser.ml"
     : (Ast.param))

let _menhir_action_25 =
  fun _1 _4 ->
    (
# 133 "lib/parser.mly"
                                           ( Param(_1, _4) )
# 457 "lib/parser.ml"
     : (Ast.param))

let _menhir_action_26 =
  fun _1 ->
    (
# 128 "lib/parser.mly"
                     ( [_1] )
# 465 "lib/parser.ml"
     : (Ast.param list))

let _menhir_action_27 =
  fun _1 _3 ->
    (
# 129 "lib/parser.mly"
                                                 ( _1 :: _3 )
# 473 "lib/parser.ml"
     : (Ast.param list))

let _menhir_action_28 =
  fun () ->
    (
# 124 "lib/parser.mly"
                ( [] )
# 481 "lib/parser.ml"
     : (Ast.param list))

let _menhir_action_29 =
  fun _1 ->
    (
# 125 "lib/parser.mly"
                          ( _1 )
# 489 "lib/parser.ml"
     : (Ast.param list))

let _menhir_action_30 =
  fun _2 ->
    (
# 62 "lib/parser.mly"
                                              ( InterfaceBody(_2) )
# 497 "lib/parser.ml"
     : (Ast.interface_body))

let _menhir_action_31 =
  fun _1 ->
    (
# 69 "lib/parser.mly"
                       ( InterfaceMethodDecl(_1) )
# 505 "lib/parser.ml"
     : (Ast.interface_body_declaration))

let _menhir_action_32 =
  fun () ->
    (
# 70 "lib/parser.mly"
              ( InterfaceEmptyDeclaration )
# 513 "lib/parser.ml"
     : (Ast.interface_body_declaration))

let _menhir_action_33 =
  fun _1 _2 ->
    (
# 65 "lib/parser.mly"
                                                           ( _1 :: _2 )
# 521 "lib/parser.ml"
     : (Ast.interface_body_declaration list))

let _menhir_action_34 =
  fun () ->
    (
# 66 "lib/parser.mly"
                ( [] )
# 529 "lib/parser.ml"
     : (Ast.interface_body_declaration list))

let _menhir_action_35 =
  fun _1 _2 _4 _5 ->
    (
# 40 "lib/parser.mly"
    (
      { i_annotations = _1;
        i_modifiers = _2;
        i_name = _4;
        i_body = _5; }
    )
# 542 "lib/parser.ml"
     : (Ast.interface_decl))

let _menhir_action_36 =
  fun _1 _2 ->
    (
# 26 "lib/parser.mly"
                                                     ( _1 :: _2 )
# 550 "lib/parser.ml"
     : (Ast.interface_decl list))

let _menhir_action_37 =
  fun _1 ->
    (
# 27 "lib/parser.mly"
                          ( [_1] )
# 558 "lib/parser.ml"
     : (Ast.interface_decl list))

let _menhir_action_38 =
  fun () ->
    (
# 115 "lib/parser.mly"
                             ( Block )
# 566 "lib/parser.ml"
     : (Ast.block))

let _menhir_action_39 =
  fun () ->
    (
# 116 "lib/parser.mly"
              ( EmptyBlock )
# 574 "lib/parser.ml"
     : (Ast.block))

let _menhir_action_40 =
  fun _1 _2 _3 _4 _6 _8 ->
    (
# 74 "lib/parser.mly"
    (
      {
        m_annotations = _1;
        m_modifiers = _2;
        m_return_type = _3;
        m_name = _4;
        m_params = _6;
        m_body = _8;  (* Всегда Block или EmptyBlock *)
      }
    )
# 591 "lib/parser.ml"
     : (Ast.method_decl))

let _menhir_action_41 =
  fun () ->
    (
# 155 "lib/parser.mly"
           ( "public" )
# 599 "lib/parser.ml"
     : (string))

let _menhir_action_42 =
  fun () ->
    (
# 156 "lib/parser.mly"
            ( "private" )
# 607 "lib/parser.ml"
     : (string))

let _menhir_action_43 =
  fun () ->
    (
# 157 "lib/parser.mly"
              ( "protected" )
# 615 "lib/parser.ml"
     : (string))

let _menhir_action_44 =
  fun () ->
    (
# 158 "lib/parser.mly"
           ( "static" )
# 623 "lib/parser.ml"
     : (string))

let _menhir_action_45 =
  fun () ->
    (
# 159 "lib/parser.mly"
             ( "abstract" )
# 631 "lib/parser.ml"
     : (string))

let _menhir_action_46 =
  fun () ->
    (
# 160 "lib/parser.mly"
          ( "final" )
# 639 "lib/parser.ml"
     : (string))

let _menhir_action_47 =
  fun _1 _2 ->
    (
# 151 "lib/parser.mly"
                       ( _1 :: _2 )
# 647 "lib/parser.ml"
     : (string list))

let _menhir_action_48 =
  fun () ->
    (
# 152 "lib/parser.mly"
                ( [] )
# 655 "lib/parser.ml"
     : (string list))

let _menhir_action_49 =
  fun _1 ->
    (
# 136 "lib/parser.mly"
              ( _1 )
# 663 "lib/parser.ml"
     : (Ast.type_type))

let _menhir_action_50 =
  fun () ->
    (
# 137 "lib/parser.mly"
         ( VoidType )
# 671 "lib/parser.ml"
     : (Ast.type_type))

let _menhir_action_51 =
  fun _1 ->
    (
# 140 "lib/parser.mly"
               ( TypeName(_1) )
# 679 "lib/parser.ml"
     : (Ast.type_type))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ABSTRACT ->
        "ABSTRACT"
    | AT ->
        "AT"
    | CLASS ->
        "CLASS"
    | COMMA ->
        "COMMA"
    | EOF ->
        "EOF"
    | FINAL ->
        "FINAL"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | INTERFACE ->
        "INTERFACE"
    | INT_LITERAL _ ->
        "INT_LITERAL"
    | LBRACE ->
        "LBRACE"
    | LBRACKET ->
        "LBRACKET"
    | LPAREN ->
        "LPAREN"
    | MAIN ->
        "MAIN"
    | PRIVATE ->
        "PRIVATE"
    | PROTECTED ->
        "PROTECTED"
    | PUBLIC ->
        "PUBLIC"
    | RBRACE ->
        "RBRACE"
    | RBRACKET ->
        "RBRACKET"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | STATIC ->
        "STATIC"
    | THROWS ->
        "THROWS"
    | VOID ->
        "VOID"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_goto_compilation_unit : type  ttv_stack. ttv_stack -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _v ->
      MenhirBox_compilation_unit _v
  
  let _menhir_run_57 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_18 _1 in
      _menhir_goto_compilation_unit _menhir_stack _v
  
  let rec _menhir_goto_class_declaration_list : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState59 ->
          _menhir_run_60 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_57 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_60 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_class_declaration -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _v ->
      let MenhirCell1_class_declaration (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_16 _1 _2 in
      _menhir_goto_class_declaration_list _menhir_stack _v _menhir_s
  
  let _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _v ->
      let _1 = _v in
      let _v = _menhir_action_19 _1 in
      _menhir_goto_compilation_unit _menhir_stack _v
  
  let rec _menhir_goto_interface_declaration_list : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState05 ->
          _menhir_run_06 _menhir_stack _v
      | MenhirState00 ->
          _menhir_run_03 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_06 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _v ->
      let MenhirCell1_interface_declaration (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_36 _1 _2 in
      _menhir_goto_interface_declaration_list _menhir_stack _v _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _2 = _v in
          let _v = _menhir_action_01 _2 in
          (match (_tok : MenhirBasics.token) with
          | AT ->
              let _menhir_stack = MenhirCell1_annotation (_menhir_stack, _menhir_s, _v) in
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState53
          | ABSTRACT | CLASS | FINAL | IDENTIFIER _ | INTERFACE | PRIVATE | PROTECTED | PUBLIC | STATIC | VOID ->
              let _1 = _v in
              let _v = _menhir_action_03 _1 in
              _menhir_goto_annotations _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_annotations : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_90 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState65 ->
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState73 ->
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState17 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_90 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_annotations (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState90
      | CLASS | INTERFACE ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_91 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState90 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_44 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_modifier : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifier (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState51
      | CLASS | IDENTIFIER _ | INTERFACE | VOID ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_41 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_43 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_42 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_46 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_45 () in
      _menhir_goto_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_52 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_modifier -> _ -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_modifier (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_47 _1 _2 in
      _menhir_goto_modifiers _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_modifiers : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState90 ->
          _menhir_run_91 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState75 ->
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState61 ->
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState51 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_91 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifiers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | INTERFACE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState91
      | CLASS ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState91
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers as 'stack) -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_INTERFACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMICOLON ->
                  _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
              | AT ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
              | ABSTRACT | FINAL | IDENTIFIER _ | PRIVATE | PROTECTED | PUBLIC | STATIC | VOID ->
                  let _v_0 = _menhir_action_04 () in
                  _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState17 _tok
              | RBRACE ->
                  let _v_1 = _menhir_action_34 () in
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_32 () in
      _menhir_goto_interface_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_interface_body_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_interface_body_declaration (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | AT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | ABSTRACT | FINAL | IDENTIFIER _ | PRIVATE | PROTECTED | PUBLIC | STATIC | VOID ->
          let _v_0 = _menhir_action_04 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState22 _tok
      | RBRACE ->
          let _v_1 = _menhir_action_34 () in
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_annotations (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
      | IDENTIFIER _ | VOID ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState24 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifiers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | IDENTIFIER _v_0 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState25
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers as 'stack) -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_50 () in
      _menhir_goto_type_or_void _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_type_or_void : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_or_void (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENTIFIER _v_1 ->
                  _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState31
              | RPAREN ->
                  let _v_2 = _menhir_action_28 () in
                  _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState31
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_51 _1 in
      _menhir_goto_type_type _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_type_type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState76 ->
          _menhir_run_86 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState78 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState49 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState25 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_86 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers -> _ -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMICOLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_modifiers (_menhir_stack, _, _2) = _menhir_stack in
              let MenhirCell1_annotations (_menhir_stack, _menhir_s, _1) = _menhir_stack in
              let (_4, _3) = (_v_0, _v) in
              let _v = _menhir_action_23 _1 _2 _3 _4 in
              let _1 = _v in
              let _v = _menhir_action_10 _1 in
              _menhir_goto_class_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_class_body_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_class_body_declaration (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
      | AT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState73
      | ABSTRACT | CLASS | FINAL | IDENTIFIER _ | PRIVATE | PROTECTED | PUBLIC | STATIC | VOID ->
          let _v_0 = _menhir_action_04 () in
          _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState73 _tok
      | RBRACE ->
          let _v_1 = _menhir_action_14 () in
          _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_66 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_12 () in
      _menhir_goto_class_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_75 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_annotations (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState75
      | CLASS | IDENTIFIER _ | VOID ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_76 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState75 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_76 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifiers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState76
      | IDENTIFIER _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LPAREN ->
              let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, MenhirState76, _v_0) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENTIFIER _v_1 ->
                  _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState78
              | RPAREN ->
                  let _v_2 = _menhir_action_28 () in
                  _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState78
              | _ ->
                  _eRR ())
          | IDENTIFIER _ ->
              let _v_3 =
                let _1 = _v_0 in
                _menhir_action_51 _1
              in
              _menhir_run_86 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 _tok
          | _ ->
              _eRR ())
      | CLASS ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState76
      | _ ->
          _eRR ()
  
  and _menhir_run_79 : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_formal_parameters (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_21 () in
          _menhir_goto_constructor_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState82
          | RBRACE ->
              let _ = _menhir_action_06 () in
              _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_constructor_body : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters -> _ -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_formal_parameters (_menhir_stack, _, _5) = _menhir_stack in
      let MenhirCell1_IDENTIFIER (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_modifiers (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_annotations (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _7 = _v in
      let _v = _menhir_action_22 _1 _2 _3 _5 _7 in
      let _1 = _v in
      let _v = _menhir_action_09 _1 in
      _menhir_goto_class_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_41 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState41
      | RBRACE ->
          let _ = _menhir_action_06 () in
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          let _ = _menhir_action_05 () in
          _menhir_goto_block_body _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block_body : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState82 ->
          _menhir_run_83 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState40 ->
          _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState41 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_83 : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_20 () in
          _menhir_goto_constructor_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_44 : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_type_or_void _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_38 () in
          _menhir_goto_method_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_method_body : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_type_or_void _menhir_cell0_IDENTIFIER, _menhir_box_compilation_unit) _menhir_cell1_formal_parameters -> _ -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_formal_parameters (_menhir_stack, _, _6) = _menhir_stack in
      let MenhirCell0_IDENTIFIER (_menhir_stack, _4) = _menhir_stack in
      let MenhirCell1_type_or_void (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_modifiers (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_annotations (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _8 = _v in
      let _v = _menhir_action_40 _1 _2 _3 _4 _6 _8 in
      _menhir_goto_method_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_method_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState73 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState65 ->
          _menhir_run_67 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_67 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_08 _1 in
      _menhir_goto_class_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_31 _1 in
      _menhir_goto_interface_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_63 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers as 'stack) -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CLASS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMICOLON ->
                  _menhir_run_66 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState65
              | AT ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState65
              | ABSTRACT | CLASS | FINAL | IDENTIFIER _ | PRIVATE | PROTECTED | PUBLIC | STATIC | VOID ->
                  let _v_0 = _menhir_action_04 () in
                  _menhir_run_75 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState65 _tok
              | RBRACE ->
                  let _v_1 = _menhir_action_14 () in
                  _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_71 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_CLASS _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _2 = _v in
      let _v = _menhir_action_07 _2 in
      let MenhirCell0_IDENTIFIER (_menhir_stack, _4) = _menhir_stack in
      let MenhirCell1_CLASS (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_modifiers (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_annotations (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_15 _1 _2 _4 _5 in
      _menhir_goto_class_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_class_declaration : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState73 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState65 ->
          _menhir_run_70 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState59 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState00 ->
          _menhir_run_59 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_70 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_11 _1 in
      _menhir_goto_class_body_declaration _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_59 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | AT ->
          let _menhir_stack = MenhirCell1_class_declaration (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState59
      | ABSTRACT | CLASS | FINAL | PRIVATE | PROTECTED | PUBLIC | STATIC ->
          let _menhir_stack = MenhirCell1_class_declaration (_menhir_stack, _menhir_s, _v) in
          let _v_0 = _menhir_action_04 () in
          _menhir_run_61 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState59 _tok
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_17 _1 in
          _menhir_goto_class_declaration_list _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_61 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_class_declaration as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_annotations (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState61
      | CLASS ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_62 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState61 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_62 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_class_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifiers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | CLASS ->
          _menhir_run_63 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState62
      | _ ->
          _eRR ()
  
  and _menhir_run_74 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_class_body_declaration -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_class_body_declaration (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_13 _1 _2 in
      _menhir_goto_class_body_declarations _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_class_body_declarations : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState73 ->
          _menhir_run_74 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState65 ->
          _menhir_run_71 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RBRACKET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENTIFIER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_1, _4) = (_v, _v_0) in
                  let _v = _menhir_action_25 _1 _4 in
                  _menhir_goto_formal_parameter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | IDENTIFIER _v_1 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_2, _1) = (_v_1, _v) in
          let _v = _menhir_action_24 _1 _2 in
          _menhir_goto_formal_parameter _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_formal_parameter : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_formal_parameter (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState49 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RPAREN ->
          let _1 = _v in
          let _v = _menhir_action_26 _1 in
          _menhir_goto_formal_parameter_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_formal_parameter_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState49 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState78 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState31 ->
          _menhir_run_47 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_formal_parameter -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_formal_parameter (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_27 _1 _3 in
      _menhir_goto_formal_parameter_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_47 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _1 = _v in
      let _v = _menhir_action_29 _1 in
      _menhir_goto_formal_parameters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_formal_parameters : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState78 ->
          _menhir_run_79 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState31 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_37 : type  ttv_stack. ((((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_type_or_void _menhir_cell0_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_formal_parameters (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMICOLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_39 () in
          _menhir_goto_method_body _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
          | RBRACE ->
              let _ = _menhir_action_06 () in
              _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_28 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_49 _1 in
      _menhir_goto_type_or_void _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_interface_body_declaration -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_interface_body_declaration (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_33 _1 _2 in
      _menhir_goto_interface_body_declarations _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_interface_body_declarations : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_compilation_unit) _menhir_state -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState17 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_20 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotations, _menhir_box_compilation_unit) _menhir_cell1_modifiers, _menhir_box_compilation_unit) _menhir_cell1_INTERFACE _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _2 = _v in
      let _v = _menhir_action_30 _2 in
      let MenhirCell0_IDENTIFIER (_menhir_stack, _4) = _menhir_stack in
      let MenhirCell1_INTERFACE (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_modifiers (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_annotations (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_35 _1 _2 _4 _5 in
      match (_tok : MenhirBasics.token) with
      | AT ->
          let _menhir_stack = MenhirCell1_interface_declaration (_menhir_stack, _menhir_s, _v) in
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
      | ABSTRACT | FINAL | INTERFACE | PRIVATE | PROTECTED | PUBLIC | STATIC ->
          let _menhir_stack = MenhirCell1_interface_declaration (_menhir_stack, _menhir_s, _v) in
          let _v_0 = _menhir_action_04 () in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState05 _tok
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_37 _1 in
          _menhir_goto_interface_declaration_list _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_annotations (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STATIC ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PUBLIC ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PROTECTED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | PRIVATE ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | FINAL ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | ABSTRACT ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | INTERFACE ->
          let _v_0 = _menhir_action_48 () in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState07 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. (((ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_interface_declaration, _menhir_box_compilation_unit) _menhir_cell1_annotations as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_compilation_unit) _menhir_state -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_modifiers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | INTERFACE ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
      | _ ->
          _eRR ()
  
  and _menhir_run_54 : type  ttv_stack. (ttv_stack, _menhir_box_compilation_unit) _menhir_cell1_annotation -> _ -> _ -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_annotation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_02 _1 _2 in
      _menhir_goto_annotations _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_compilation_unit =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AT ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | ABSTRACT | CLASS | FINAL | INTERFACE | PRIVATE | PROTECTED | PUBLIC | STATIC ->
          let _v = _menhir_action_04 () in
          _menhir_run_90 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let compilation_unit =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_compilation_unit v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
