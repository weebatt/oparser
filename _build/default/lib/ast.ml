(* lib/ast.ml *)

type modifier = string [@@deriving yojson]
type annotation = string [@@deriving yojson]

type type_type = 
  | TypeName of string
  | VoidType
[@@deriving yojson]

type param = Param of type_type * string
[@@deriving yojson]

type block =
  | Block
  | EmptyBlock
[@@deriving yojson]

type method_decl = {
  m_annotations : annotation list;
  m_modifiers : modifier list;
  m_return_type : type_type;
  m_name : string;
  m_params : param list;
  m_body : block;
} [@@deriving yojson]

type constructor_decl = {
  c_annotations : annotation list;
  c_modifiers : modifier list;
  c_name : string;
  c_params : param list;
  c_body : block;
} [@@deriving yojson]

type field_decl = {
  f_annotations : annotation list;
  f_modifiers : modifier list;
  f_type : type_type;
  f_name : string;
} [@@deriving yojson]

type class_decl = {
  cl_annotations : annotation list;
  cl_modifiers : modifier list;
  cl_name : string;
  cl_body : class_body;
} [@@deriving yojson]

and interface_decl = {
  i_annotations : annotation list;
  i_modifiers : modifier list;
  i_name : string;
  i_body : interface_body;
} [@@deriving yojson]

and class_body_declaration = 
  | ClassMethodDecl of method_decl
  | ConstructorDecl of constructor_decl
  | FieldDecl of field_decl
  | ClassEmptyDeclaration
  | NestedClassDecl of class_decl
[@@deriving yojson]

and class_body = ClassBody of class_body_declaration list
[@@deriving yojson]

and interface_body_declaration =
  | InterfaceMethodDecl of method_decl
  | InterfaceEmptyDeclaration
[@@deriving yojson]

and interface_body = InterfaceBody of interface_body_declaration list
[@@deriving yojson]

type compilation_unit = 
  | ClassCompilation of class_decl list
  | InterfaceCompilation of interface_decl list
[@@deriving yojson]
