(* lib/parser.mly *)

%{
  open Ast
%}

%token CLASS INTERFACE PUBLIC PRIVATE PROTECTED STATIC ABSTRACT FINAL VOID THROWS MAIN
%token LBRACE RBRACE LPAREN RPAREN SEMICOLON COMMA LBRACKET RBRACKET
%token AT
%token <string> IDENTIFIER
%token <int> INT_LITERAL
%token EOF

%start <Ast.compilation_unit> compilation_unit
%%

compilation_unit:
  | class_declaration_list EOF { ClassCompilation($1) }
  | interface_declaration_list EOF { InterfaceCompilation($1) }

class_declaration_list:
  | class_declaration class_declaration_list { $1 :: $2 }
  | class_declaration { [$1] }

interface_declaration_list:
  | interface_declaration interface_declaration_list { $1 :: $2 }
  | interface_declaration { [$1] }

class_declaration:
  | annotations modifiers CLASS IDENTIFIER class_body 
    {
      { cl_annotations = $1;
        cl_modifiers = $2;
        cl_name = $4; 
        cl_body = $5; }
    }

interface_declaration:
  | annotations modifiers INTERFACE IDENTIFIER interface_body
    {
      { i_annotations = $1;
        i_modifiers = $2;
        i_name = $4;
        i_body = $5; }
    }

class_body:
  | LBRACE class_body_declarations RBRACE { ClassBody($2) }

class_body_declarations:
  | class_body_declaration class_body_declarations { $1 :: $2 }
  | /* empty */ { [] }

class_body_declaration:
  | method_declaration { ClassMethodDecl($1) }
  | constructor_declaration { ConstructorDecl($1) }
  | field_declaration { FieldDecl($1) }
  | class_declaration { NestedClassDecl($1) }
  | SEMICOLON { ClassEmptyDeclaration }

interface_body:
  | LBRACE interface_body_declarations RBRACE { InterfaceBody($2) }

interface_body_declarations:
  | interface_body_declaration interface_body_declarations { $1 :: $2 }
  | /* empty */ { [] }

interface_body_declaration:
  | method_declaration { InterfaceMethodDecl($1) }
  | SEMICOLON { InterfaceEmptyDeclaration }

method_declaration:
  | annotations modifiers type_or_void IDENTIFIER LPAREN formal_parameters RPAREN method_body 
    {
      {
        m_annotations = $1;
        m_modifiers = $2;
        m_return_type = $3;
        m_name = $4;
        m_params = $6;
        m_body = $8;  (* Всегда Block или EmptyBlock *)
      }
    }

constructor_declaration:
  | annotations modifiers IDENTIFIER LPAREN formal_parameters RPAREN constructor_body 
    {
      {
        c_annotations = $1;
        c_modifiers = $2;
        c_name = $3; 
        c_params = $5;
        c_body = $7;   (* Всегда Block или EmptyBlock *)
      }
    }

field_declaration:
  | annotations modifiers type_type IDENTIFIER SEMICOLON
    {
      {
        f_annotations = $1;
        f_modifiers = $2;
        f_type = $3;
        f_name = $4;
      }
    }

(* Правило для пропуска содержимого блока *)
block_body:
  | LBRACE block_body RBRACE { () }   (* Рекурсивно пропускаем содержимое внутри фигурных скобок *)
  | /* empty */ { () }

(* Определение тела метода *)
method_body:
  | LBRACE block_body RBRACE { Block }   (* Тело присутствует, но содержимое игнорируется *)
  | SEMICOLON { EmptyBlock }             (* Метод без тела, например, абстрактный или в интерфейсе *)

(* Определение тела конструктора *)
constructor_body:
  | LBRACE block_body RBRACE { Block }   (* Конструктор с телом, содержимое игнорируется *)
  | SEMICOLON { EmptyBlock }             (* Конструктор без тела, что редко, но возможно *)

formal_parameters:
  | /* empty */ { [] }
  | formal_parameter_list { $1 }

formal_parameter_list:
  | formal_parameter { [$1] }
  | formal_parameter COMMA formal_parameter_list { $1 :: $3 }

formal_parameter:
  | type_type IDENTIFIER { Param($1, $2) }
  | type_type LBRACKET RBRACKET IDENTIFIER { Param($1, $4) }

type_or_void:
  | type_type { $1 }
  | VOID { VoidType }

type_type:
  | IDENTIFIER { TypeName($1) }

annotations:
  | annotation annotations { $1 :: $2 }
  | annotation { [$1] }
  | /* empty */ { [] }

annotation:
  | AT IDENTIFIER { $2 }

modifiers:
  | modifier modifiers { $1 :: $2 }
  | /* empty */ { [] }

modifier:
  | PUBLIC { "public" }
  | PRIVATE { "private" }
  | PROTECTED { "protected" }
  | STATIC { "static" }
  | ABSTRACT { "abstract" }
  | FINAL { "final" }
