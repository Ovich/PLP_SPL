module Main
(
    repl,
    main
)

where 

import Data.Char
import ParserMin
import LexerMin
import Environment

-- Nom du Language
languageName = "SPL"
introMessage = "\n" ++ languageName ++ " \ 
\Ready : To exit type 'EXIT' \n\n \
\Predefined Fonctions \t:\tsucc(X), pred(X), fact(X), add(X,Y), sub(X,Y), pow(X,Y), abs(X), sum(X), even(X), \n \
\\t\t\t\tcollatz(X), div(X,Y), modulos(X,Y), ackermann(X,Y), mccarthy(X), euclide(X,Y),\n\
\\t\t\t\tpuissance(X,Y) \n\n \
\Identifier rules \t:\tFonction name starts with lowercase\n\ 
\\t\t\t\tVar name starts with uppercase (dont call it EXIT)\n \
\Fonction Definition \t:\tdef [name] [Args] = [Exp] \t - Exemple : def test X = X + 1 \n \
\Variable Definition \t:\tdef [name] = [Exp] \t\t - Exemple : def Test = 1 \n\n \
\Fonction Execution \t:\tname(Args) \t\t\t - Exemple : test(2) \n \
\Available Operators \t:\tBinary Ops ( + | - | * | / | ^ | % | < | <= | > | >= | == | != )\n\
\\t\t\t\tUnary Ops  ( - | ++ (postfix and prefix) | ! )\n\n"

-- Environnement Vide
env = ([], [])

fact n = if (n <= 1) then 1 else eval (Bin "*" (Cst n) (Unary "!" (Cst (n-1)))) env
bool op x y = if (op x y ) then 1 else 0

-- Evaluation des constantes littérales et des variables
eval (Cst n) _ = n
eval (Var v) env = value v env

-- Evaluation des opérations binaires
eval (Bin "+" x y) env = (eval x env) + (eval y env)
eval (Bin "-" x y) env = (eval x env) - (eval y env)
eval (Bin "*" x y) env = (eval x env) * (eval y env)
eval (Bin "/" x y) env = (eval x env) `div` (eval y env)
eval (Bin "^" x y) env = (eval x env) ^ (eval y env)
eval (Bin "%" x y) env = (eval x env) `mod` (eval y env)

-- Gestion des évaluations binaires booléennes
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
-- Evaluation de let
eval (Let name exp1 exp2) env = eval exp2 (((name, eval exp1 env):(fst env)), snd env)
-- Evaluation des conditions (if)
eval (If cond x y) env = if eval cond env > 0 then eval x env else eval y env
-- Evaluation de Fonctions
eval (App func xs) env = eval x (expand env vars xs) where (vars,x) = extract func env

value name (vars,_) = value' name vars
    where 
        value' name [] = 0
        value' name ((var,val):vars) = if var == name then val else value' name vars

-- Extraction de la fonction de l'environnement pour l'application de fonctions
-- Extract cherche la fonction qui porte le nom "name"   
-- Elle donne une exception dans le cas où la fonction appelée n'existe pas dans l'environnement   
extract name (_,[]) = error $ "No functions defined : (use def)"
extract name (_,funcs) = extract' name funcs
    where
        extract' name [] = error $ "Undefined function : " ++ name
        extract' name ((func,vars,body):funcs) =
            if func == name then (vars,body) else extract' name funcs

-- La fonction expand empile les arguments sous forme de variables dans l'environnement
-- L'existence précédente d'une variable du même nom n'est pas verifiée
-- Utilisée pendant l'application de fonction et sans effets en dehors de cette application de fonction
-- Si une fonction est appelée avec trop d'arguments, seul ceux significatifs seront pris en compte
-- Une exception est produite si l'utilisateur fait un appel sans assez arguments
expand env [] [] = env
expand env _ [] = error $ "Too few arguments provided during fonction call"
expand env (v:vs) (x:xs) = ((v,eval x env):vars,funcs)
    where
        (vars,funcs) = expand env vs xs

-- Variables et Fonctions définies par le développeur
-- Nos 2 fonctions def vont chercher et remplacer une éventuelle occurence de la variable ou de la fonction déjà 
-- existantes dans l'environnement qui a le même nom. 
-- Elle ne va pas juste empiler comme le fait la fonction expand pendant l'application de fonctions
-- car à la différence de expand, l'effet de def reste durant toute l'exécution du programme
def (DefFn new_name new_args new_body) all@(vars,funcs) = (vars, def' (DefFn new_name new_args new_body) funcs)
   where 
       def' (DefFn new_name new_args new_body) [] = (new_name,new_args,new_body):[]
       def' (DefFn new_name new_args new_body) ((name,args,body):funcs)
           | name /= new_name = (name,args,body):def' (DefFn new_name new_args new_body) funcs
           | otherwise = (new_name,new_args,new_body):funcs

def (DefVar new_name new_exp) all@(vars,funcs) = (def' (DefVar new_name new_exp) vars, funcs)
   where 
       def' (DefVar new_name new_exp) [] = (new_name,eval new_exp all):[]
       def' (DefVar new_name new_exp) ((name,exp):vars)
           | name /= new_name = (name,exp):def' (DefVar new_name new_exp) vars
           | otherwise = (new_name,eval new_exp all):vars

-- Predefine parcourir et parser le tableau de string contenant des définition de fonctions 
-- ou des variables et va les ajouter dans l'environnement de départ (environnement prédéfinis)
predefine [] env = env
predefine (x:xs) env = predefine xs (def (parser $ lexer x) env)

-- vars et funcs sont issues du fichier Environment.hs
-- Lancement à partir de main permet de charger l'environnement avec des fonctions et des variables 
-- prédefinies
main = 
    do
        putStrLn $ introMessage
        repl (predefine funcs (predefine vars env))

-- REPL prends en paramètre l'environnement et non pas qu'une liste de fonctions
-- Ce REPL permet d'avoir des variables prédéfinies et la définition des variables
-- nécessitant la possibilité d'extension de la totalité de l'environnement
repl env = 
  do
    putStr $ (languageName ++ ">")
    line <- getLine
    if line /= "EXIT" then
        if length line < 1 then 
            do
                putStrLn $ "Expression too short... try again" 
                repl env 
        else 
            do
                let tokens = lexer line
                putStrLn $ show tokens
                let ast = parser tokens
                putStrLn $ show ast
                case ast of
                    DefFn name _ _ 
                        -> let new_env = def ast env in 
                                do 
                                    putStrLn $ "Fonction '" ++ name ++ "' defined!"
                                    repl new_env
                    DefVar name _  
                        -> let new_env = def ast env in 
                                do
                                    putStrLn $ "Variable '" ++ name ++ "' defined!"
                                    repl new_env 
                    PreInc "++" (Var name)
                        -> let incremented = (eval ast env) -- Pré incrémentation renvoi la valeur incrémentée et etends l'environnement
                               new_env = def (DefVar (name) (Cst incremented)) env 
                            in 
                                do
                                    putStrLn $ show incremented
                                    repl new_env 
                    PostInc "++" (Var name)
                        -> let val = value name env -- On récupère la valeur avant l'incrémentation et on étends l'environnement par la suite
                               new_env = def (DefVar (name) (Cst (eval ast env))) env 
                            in 
                                do
                                    putStrLn $ show val
                                    repl new_env 
                    _   ->   -- Toute expression necessitant que l'evaluation
                        do
                            putStrLn $ show $ eval ast env 
                            repl env 
    else 
        return ()
