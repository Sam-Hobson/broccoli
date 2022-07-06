module ModuleParser where

import BasicParserFuncs
import ExprLexer (functionCall, expr)
import ParseTypes (Function, Statement (..), Expr)
import Parser
import SyntaxParserFuncs (idToken, typeToken)
import VarLexer (varDeclaration, varInitialisation, varParser)

function :: Parser Function
function = do
  tok $ string "fun"
  name <- idToken
  args <- surround "(" (sepby varParser $ tok $ is ',') ")"
  rtype <- typeToken
  funContent <- surround "{" codeModule "}"
  pure (name, args, rtype, funContent)

ret :: Parser Expr
ret = tok (string "return") >> expr

statement :: Parser Statement
statement =
    (Ret <$> ret)
    ||| (FD <$> function)
    ||| (FC <$> functionCall)
    ||| (V <$> varParser)

-- Parses code with ';' separating each statement.
--
-- >>> parse codeModule "x: int = 3; y: string = \"salad\"; fun dog(x: int): string {print(hi());};"
-- <Parsed: [V ("x",PInt,Equation (Number 3)),V ("y",PString,String "salad"),FD ("dog",[("x",PInt,None)],PString,[FC ("print",SymbolCall ("hi",None))])]> <Remaining: "">
codeModule :: Parser [Statement]
codeModule = sepby statement (tok $ is ';') <* tok (maybeString ";")
