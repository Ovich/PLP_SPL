{ 
module ParserMin where 
import LexerMin 
} 

%name parser 
%tokentype { Token } 
%error { parseError } 

-- Liste des terminaux de la grammaire. 

%token   
    let  { TLet }   
    in   { TIn }
    def  { TDef }	
    int  { TInt $$ }   
    var  { TVar $$ }
    func { TFunc $$ }
    if   { TIf }
    then { TThen }
    else { TElse }	
    "="  { TSym "=" }   
    "+"  { TSym "+" }   
    "-"  { TSym "-" }   
    "*"  { TSym "*" }
    "/"  { TSym "/"  }
    "%"  { TSym "%"          }
    "^"  { TSym "^"          }
    "++" { TSym "++"         }
    "==" { TCompare "=="     }
    "!=" { TCompare "!="     }
    "<=" { TCompare "<="     }
    "<"  { TCompare "<"      }
    ">=" { TCompare ">="     }
    ">"  { TCompare ">"      }
    ','  { TComma        }
    '('  { TLParenthesis }
    ')'  { TRParenthesis }
    "!"  { TSym "!" }
	
-- Définition des priorités et associativité 

%right in else
%left "<" ">" "==" "!=" "<=" ">=" "," "="
%left "+" "-" 
%left "*" "/"
%left "%" "!" "++" "^" %% 

-- Règles de la grammaire 

Line : Def { $1 }
     | Exp { $1 }

Def : def func Args "=" Exp    { DefFn $2 $3 $5 }
    | def var "=" Exp          { DefVar $2 $4   }

Exp : let var "=" Exp in Exp   { Let $2 $4 $6   }
    | if Exp then Exp else Exp { If $2 $4 $6    } 
    | func '(' Exps ')'        { App $1 $3      } 
    | Exp "+" Exp              { Bin "+" $1 $3  }
    | Exp "-" Exp              { Bin "-" $1 $3  }     
    | Exp "*" Exp              { Bin "*" $1 $3  }
    | Exp "/" Exp              { Bin "/" $1 $3  } 	
    | Exp "%" Exp              { Bin "%" $1 $3  }
    | Exp "^" Exp              { Bin "^" $1 $3  }
    | Exp "==" Exp             { Bin "==" $1 $3 }
    | Exp "!=" Exp             { Bin "!=" $1 $3 }
    | Exp "<" Exp              { Bin "<" $1 $3  }
    | Exp ">" Exp              { Bin ">" $1 $3  }
    | Exp ">=" Exp             { Bin ">=" $1 $3 }
    | Exp "<=" Exp             { Bin "<=" $1 $3 }
    | "-" Exp                  { Unary "-" $2   }
    | Exp "++"                 { PostInc "++" $1}
    | "++" Exp                 { PreInc "++" $2 }
    | Exp "!"                  { Unary "!" $1   }
    | int                      { Cst $1         }     
    | var                      { Var $1         }      

Exps : Exp                     { [$1] }
     | Exp ',' Exps            { $1:$3 }

Args : var                     { [$1] }
     | var Args                { $1:$2 }

{
parseError :: [Token] -> a 
parseError _ = error "Parse error" 

-- Définition du type Exp utilisé pour construire l'arbre syntaxique. 
data Exp = Let Name Exp Exp | Bin Name Exp Exp | Cst Int | Var Name | 
      Unary Name Exp | PreInc Name Exp | PostInc Name Exp | If Exp Exp Exp | 
	  App Name [Exp] | DefFn Name [Name] Exp | DefVar Name Exp deriving Show 
} 
