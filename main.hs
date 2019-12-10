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
import Prelude
import ParserMin
import LexerMin

-- Nom du Language
languageName = "SPL"
introMessage = "\n" ++ languageName ++ " Ready : To exit type 'EXIT' \n Identifier rules \t\t : Fonction name starts with lowercase | Var name starts with uppercase \n Predefined Fonctions \t\t : succ(X), pred(X), fact(X) \n Fonction Definition \t\t : def [name] [Args] = [body] \t - Exemple : def test X = X + 1 \n Fonction Execution \t\t : name(Args) \t\t\t - Exemple : test(2) \n Available Operators \t\t : (+|-|*|<|>|==)"

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


env = (vars, funcs)


-- Fonctions

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
eval (Unary "-" x) env = - eval x env
eval (Unary "++" x) env = (eval x env) + 1
eval (Unary "!" x) env = fact (eval x env)

-- Evaluation des conditions (if)
eval (If cond x y) env = if eval cond env > 0 then eval x env else eval y env
-- Evaluation de Fonctions
eval (App func xs) env = eval x (expand env vars xs) where (vars,x) = extract func env

-- Variables et Fonctions définies par le développeur
def (DefVar name exp) (vars,funcs) =  ((name, eval exp env):vars,funcs)
def (DefFn name args body) (vars,funcs) = (vars, ((name,args,body):funcs))

-- La Fonction runtime gérè les les cas de figures se produisant dans le main
-- Elle gére les valeurs evalués a afficher ou des extentions d'environement 
-- selon les cas de figures
runtime exp env =
    do 
        case exp of
            DefFn name _ _ 
                -> let new_env = def exp env in main' new_env ("Fonction '" ++ name ++ "' defined!") 
            DefVar name _  
                -> let new_env = def exp env in main' new_env ("Variable '" ++ name ++ "' defined!") 
            Unary "++" (Var name)
                -> let incremented = (eval exp env) -- Operateur d'incrémentation nécecite une extention de l'environement
                       new_env = def (DefVar (name) (Cst incremented)) env 
                     in main' new_env (show incremented) 
            _ 
                -> main' env $ show $ eval exp env

main = main' env introMessage
main' env display = 
  do
    putStrLn $ display
    putStr $ (languageName ++ " > ")
    s <- getLine
    if s /= "EXIT" then
        let exp = parser $ lexer s in runtime exp env
    else 
        return ()
