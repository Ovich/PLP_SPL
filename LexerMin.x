{ 
-- Définition du nom du module et des exports. 
module LexerMin (lexer, Name, Op, Token(..)) where 
} 

-- Le wrapper définit le type de analyseur que Alex va générer. 

%wrapper "basic" 
$digit = 0-9       -- Macro pour définir les chiffres. 
$alpha = [A-Za-z]  -- Macro pour définir les majuscules et les minuscules
$upper = [A-Z]     -- Macro pour définir les majuscules. 
$lower = [a-z]     -- Macro pour définir les minuscules

-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token 
tokens :-   

$white+                       ;   
if                            { \s -> TIf           }
then                          { \s -> TThen         }
else                          { \s -> TElse         }
let                           { \s -> TLet          }   
in                            { \s -> TIn           }
def                           { \s -> TDef          }
\(                            { \s -> TLParenthesis } 
\)                            { \s -> TRParenthesis }
\,                            { \s -> TComma        } 
\-\- .*                       { \s -> TComment      }
\+\+                          { \s -> TSym s        } 
[\=\*\+\-\!\/\%\^]            { \s -> TSym s        }
\<|\>|\<\=|\>\=|\=\=|\!\=     { \s -> TCompare s    }
$digit+                       { \s -> TInt (read s) }   
$upper [$alpha $digit \_]*    { \s -> TVar s        }   
$lower [$alpha $digit \_]*    { \s -> TFunc s       }


{ -- Définition du type Token. 
type Name = [Char]
type Op = [Char] 
data Token = TLet | TIn | TIf | TThen | TDef | TComma | TElse | TSym Op | 
    TCompare Op |TVar Name | TName Name | TInt Int | TLParenthesis | 
    TRParenthesis | TFunc Name | TComment deriving (Eq,Show) 

-- Alias du nom de la fonction d'analyse lexicale. 
lexer = alexScanTokens 
}
