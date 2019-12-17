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
import Environement

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

-- Environement Vide
env = ([], [])

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
-- Nos 2 fonctions def vont chercher et remplacer une éventuelle occurence de la variable ou de la fonction
-- ayant le même nom. Elle ne va pas juste empiler comme le fait la fonction expand donnée dans le cours
def (DefFn new_name new_args new_body) (vars,funcs) = (vars, expander (DefFn new_name new_args new_body) funcs)
   where 
       expander (DefFn new_name new_args new_body) [] = (new_name,new_args,new_body):[]
       expander (DefFn new_name new_args new_body) ((name,args,body):funcs)
           | name /= new_name = (name,args,body):expander (DefFn new_name new_args new_body) funcs
           | otherwise = (new_name,new_args,new_body):funcs

def (DefVar new_name new_exp) (vars,funcs) = (expander (DefVar new_name new_exp) vars, funcs)
   where 
       expander (DefVar new_name new_exp) [] = (new_name,eval new_exp (vars,[])):[]
       expander (DefVar new_name new_exp) ((name,exp):vars)
           | name /= new_name = (name,exp):expander (DefVar new_name new_exp) vars
           | otherwise = (new_name,eval new_exp (vars,[])):vars

           -- La Fonction runtime s'occupe de gestion des expressions
-- Elle gère les expressions à evaluer et envoyer la valeur au main pour l'affichage 
-- ou les expressions qui étendent l'environement : def et ++
runtime exp env =
    do 
        case exp of
            DefFn name _ _ 
                -> let new_env = def exp env in repl new_env $ "Fonction '" ++ name ++ "' defined!"
            DefVar name _  
                -> let new_env = def exp env in repl new_env $ "Variable '" ++ name ++ "' defined!"
            PreInc "++" (Var name)
                -> let incremented = (eval exp env) -- Pré incrémentation renvoi la valeur incrémentée et etends l'environement
                       new_env = def (DefVar (name) (Cst incremented)) env 
                     in repl new_env (show incremented) 
            PostInc "++" (Var name)
                -> let val = value name env -- On récupère la valeur avant l'incrémentation et on étends l'environement par la suite
                       new_env = def (DefVar (name) (Cst (eval exp env))) env 
                     in repl new_env (show val) 
            _   -> repl env $ show $ eval exp env -- Toute expression necessitant que l'evaluation

-- Predefine parcourir et parser le tableau de string contenant des définition de fonctions 
-- ou des variables et va les ajouter dans l'environement de départ (environement prédéfinis)
predefine [] env = env
predefine (x:xs) env = predefine xs (def (parser $ lexer x) env)
-- vars et funcs sont issue du fichier Environement.hs
main = repl (predefine funcs (predefine vars env)) introMessage
repl env display = 
  do
    putStrLn $ show $ env
    putStrLn $ display
    putStr $ (languageName ++ "> ")
    line <- getLine
    if line /= "EXIT" then
        
        if length line < 1 then 
            repl env "Expression too short... try again" 
        else 
            do
                let tokens = lexer line
                putStrLn $ show tokens
                let ast = parser tokens
                putStrLn $ show ast
                runtime ast env
    else 
        return ()
