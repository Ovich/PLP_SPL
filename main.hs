module Main
(
    eval,
    value,
    extract,
    expand,
    main
)

where 

import Data.Char
import ParserMin
import LexerMin

-- Nom du Language
languageName = "SPL"
introMessage = "\n" ++ languageName ++ " \ 
\Ready : To exit type 'EXIT' \n\n \
\Predefined Fonctions \t:\tsucc(X), pred(X), fact(X), add(X), sub(X), pow(X), abs(X), sum(X), even(X), \n \
\\t\t\t\tcollatz(X), div(X), modulos(X), ackermann(X,Y)  \n\n \
\Identifier rules \t:\tFonction name starts with lowercase\n\ 
\\t\t\t\tVar name starts with uppercase (dont call it EXIT)\n \
\Fonction Definition \t:\tdef [name] [Args] = [Exp] \t - Exemple : def test X = X + 1 \n \
\Variable Definition \t:\tdef [name] = [Exp] \t\t - Exemple : def Test = 1 \n\n \
\Fonction Execution \t:\tname(Args) \t\t\t - Exemple : test(2) \n \
\Available Operators \t:\tBinary Ops ( + | - | * | / | ^ | % | < | <= | > | >= | == | != )\n\
\\t\t\t\tUnary Ops  ( - | ++ (postfix and prefix) | ! )\n\n"

-- Variables utilisées
vars = [("X", 12), ("Y", 23), ("Xy", 32)]

funcs =
    [
        ("pred",["N"],Bin "-" (Var "N") (Cst 1)),
        ("fact",["N"],
            If
                (Var "N")
                (Bin "*" (Var "N") (App "fact" [App "pred" [Var "N"]]))
                (Cst 1)),
        ("succ",["N"],Bin "+" (Var "N") (Cst 1)),
        ("add", ["N", "M"], Bin "+" (Var "N") (Var "M")),
        ("sub", ["N", "M"], Bin "-" (Var "N") (Var "M")),
        ("pow", ["N", "M"], Bin "^" (Var "N") (Var "M")),
        ("abs", ["N"], 
            If
                (Var "N")
                (Var "N")
                (Unary "-" (Var "N"))),
        ("sum", ["N"], 
            If
                (Var "N")
                (Bin "+" (Var "N") (App "sum" [App "pred" [Var "N"]]))
                (Cst 0)),
        ("even", ["N"], Bin "%" (Var "N") (Cst 2)), 
        ("collatz", ["N"],
            If
                (Bin "=" (Var "N") (Cst 1)) 
                (Cst 0) (
                    If
                        (App "even" [(Var "N")])
                        (Bin "+" (Cst 1) (App "collatz" [Bin "/" (Var "N") (Cst 2)]))
                        (Bin "+" (Cst 1) (App "collatz" [Bin "+" (Bin "*" (Var "N") (Cst 3)) (Cst 1)]))
                         )
        ),
        ("div", ["N", "M"], Bin "/" (Var "N") (Var "M")),
        ("modulos", ["N", "M"], Bin "%" (Var "N") (Var "M")),
        ("ackermann", ["M","N"],
            If
            (Bin "==" (Var "M") (Cst 0))
            (App "succ" [(Var "N")])
            (If (Bin "==" (Var "N") (Cst 0))
                (App "ackermann" [(App "pred" [(Var "M")]), Cst 1])
                (App "ackermann" [(App "pred" [(Var "M")]), App "ackermann" [Var "M", (App "pred" [(Var "N")])]])
            )
        )
    ]

-- Environement Prédéfini
env = (vars, funcs)

fact n = if (n <= 1) then 1 else eval (Bin "*" (Cst n) (Unary "!" (Cst (n-1)))) env
bool op x y = if (op x y ) then 1 else 0

-- Evaluation des constantes litérales et des variables
eval (Cst n) _ = n
eval (Var v) env = value v env

-- Evaluation des opérations binaires
eval (Bin "+" x y) env = (eval x env) + (eval y env)
eval (Bin "-" x y) env = (eval x env) - (eval y env)
eval (Bin "*" x y) env = (eval x env) * (eval y env)
eval (Bin "/" x y) env = (eval x env) `div` (eval y env)
eval (Bin "^" x y) env = (eval x env) ^ (eval y env)
eval (Bin "%" x y) env = (eval x env) `mod` (eval y env)

-- Gestion des évaluations binaires booleenes
-- (0 - False | 1 - True)
eval (Bin "==" x y ) env = bool (==) (eval x env) (eval y env)
eval (Bin ">" x y ) env = bool (>) (eval x env) (eval y env)
eval (Bin "<" x y ) env = bool (<) (eval x env) (eval y env)
eval (Bin ">=" x y ) env = bool (>=) (eval x env) (eval y env)
eval (Bin "<=" x y ) env = bool (<=) (eval x env) (eval y env)
eval (Bin "!=" x y ) env = bool (/=) (eval x env) (eval y env)

-- Evaluation des opérations unaires
eval (Unary "-" x) env = - eval x env -- Nombres Négatifs
eval (Unary "!" x) env = fact (eval x env) -- Factorielle
eval (PostInc "++" x) env = (eval x env) + 1  -- Post Incrémentation
eval (PreInc "++" x) env = (eval x env) + 1  -- Pré incrémentation

-- Evaluation des conditions (if)
eval (If cond x y) env = if eval cond env > 0 then eval x env else eval y env
-- Evaluation de Fonctions
eval (App func xs) env = eval x (expand env vars xs) where (vars,x) = extract func env

value name (vars,_) = value' name vars
    where 
        value' name [] = 0
        value' name ((var,val):vars) = if var == name then val else value' name vars

extract name (_,funcs) = extract' name funcs
    where
        extract' name [] = error $ "Undefined function : " ++ name
        extract' name ((func,vars,body):funcs) =
            if func == name then (vars,body) else extract' name funcs

expand env [] [] = env
expand env (v:vs) (x:xs) = ((v,eval x env):vars,funcs)
    where
        (vars,funcs) = expand env vs xs

-- Variables et Fonctions définies par le développeur
def (DefVar name exp) (vars,funcs) = ((name, eval exp env):vars,funcs)
def (DefFn name args body) (vars,funcs) = (vars, ((name,args,body):funcs))

-- La Fonction runtime s'occupe de gestion des expressions
-- Elle gère les expressions à evaluer et envoyer la valeur au main pour l'affichage 
-- ou les expressions qui étendent l'environement : def et ++
runtime exp env =
    do 
        case exp of
            DefFn name _ _ 
                -> let new_env = def exp env in main' new_env $ "Fonction '" ++ name ++ "' defined!"
            DefVar name _  
                -> let new_env = def exp env in main' new_env $ "Variable '" ++ name ++ "' defined!"
            PreInc "++" (Var name)
                -> let incremented = (eval exp env) -- Pré incrémentation renvoi la valeur incrémentée et etends l'environement
                       new_env = def (DefVar (name) (Cst incremented)) env 
                     in main' new_env (show incremented) 
            PostInc "++" (Var name)
                -> let val = value name env -- On récupère la valeur avant l'incrémentation et on étends l'environement par la suite
                       new_env = def (DefVar (name) (Cst (eval exp env))) env 
                     in main' new_env (show val) 
            _   -> main' env $ show $ eval exp env -- Toute expression necessitant que l'evaluation

main = main' env introMessage
main' env display = 
  do
    putStrLn $ display
    putStr $ (languageName ++ " > ")
    s <- getLine
    if s /= "EXIT" then
        if length s <= 3 then 
            main' env "Expression too short... try again" 
        else 
            let exp = parser $ lexer s in runtime exp env
    else 
        return ()
