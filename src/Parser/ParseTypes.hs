module ParseTypes where

data Equation
  = Plus    Equation Equation
  | Minus   Equation Equation
  | Times   Equation Equation
  | E       Expr
  deriving (Show, Eq)

type FunctionData = (String, [Expr])

data BoolCompOp
    = EqOP        BoolCompOp BoolCompOp
    | GreaterOP   BoolCompOp BoolCompOp
    | GreaterEqOP BoolCompOp BoolCompOp
    | LessOP      BoolCompOp BoolCompOp
    | LessEqOP    BoolCompOp BoolCompOp
    | NotEqOP     BoolCompOp BoolCompOp
    | E1          Expr
    deriving (Show, Eq)

data BoolLogicalOp
    = AndOP       BoolLogicalOp BoolLogicalOp
    | OrOP        BoolLogicalOp BoolLogicalOp
    | NotOP       BoolLogicalOp
    | E2          Expr
    deriving (Show, Eq)

data Expr
  = Number          Integer
  | String          String
  | Symbol          String
  | Boolean         Bool
  | BoolCompOp      BoolCompOp
  | BoolLogicalOp   BoolLogicalOp
  | Equation        Equation
  | SymbolCall      FunctionData
  | Priority        Expr
  | None
  deriving (Show, Eq)

-- Data types that can be parsed
data Type
  = PInt
  | PString
  | PBool
  | PVoid
  deriving (Show, Eq)

type Var = (String, Type, Expr)

type Function = (String, [Var], Type, [Statement])

data Statement
  = FD  Function
  | FC  FunctionData
  | V   Var
  | Ret Expr
  | Empty
  deriving (Show, Eq)
