module Exceptions where

import Control.Exception (Exception)
import Data.Data (Typeable)

newtype NonMatchingTypeException
  = NonMatchingTypeException String
  deriving (Show, Typeable)

instance Exception NonMatchingTypeException


newtype UnboundSymbolException
  = UnboundSymbolException String
  deriving (Show, Typeable)

instance Exception UnboundSymbolException

newtype ScopeException
  = ScopeException String
  deriving (Show, Typeable)

instance Exception ScopeException

newtype InvalidEquationException
  = InvalidEquationException String
  deriving (Show, Typeable)

instance Exception InvalidEquationException

newtype MismatchedParameterException
  = MismatchedParameterException String
  deriving (Show, Typeable)

instance Exception MismatchedParameterException

newtype ExpectedPrimitiveTypeException
  = ExpectedPrimitiveTypeException String
  deriving (Show, Typeable)

instance Exception ExpectedPrimitiveTypeException

newtype InvalidBooleanException
  = InvalidBooleanException String
  deriving (Show, Typeable)

instance Exception InvalidBooleanException
