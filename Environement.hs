module Environement
(
    funcs,
    vars
)

where

funcs = [
    "def pred N = N - 1", 
    "def fact N = if N then N * fact(pred (N)) else 1", 
    "def succ N = N + 1", 
    "def add N M = N + M", 
    "def sub N M = N - M",
    "def mul N M = N * M",
    "def pow N M = N ^ M", 
    "def abs N = if N then N else -N", 
    "def sum N = if N then N + sum(pred(N)) else 0", 
    "def odd N = N % 2", 
    "def collatz N = if N == 1 then 0 else if odd(N) then 1 + collatz(N * 3 + 1) else 1 + collatz(N / 2)", 
    "def div N M = N / M", 
    "def modulos N M = N % M", 
    "def ackermann M N = if M == 0 then succ(N) else if N == 0 then ackermann(pred(M), 1) else ackermann(pred(M), ackermann(M, pred(N)))",
    "def mccarthy N = if N > 100 then N - 10 else mccarthy(mccarthy(N + 11))",
    "def euclide M N = if N == 0 then M else euclide(N, modulos(M,N))",
    "def lucas X N = if N == 0 then 1 else if odd(N) then mul(X,lucas(X,N-1)) else pow(lucas(X,N/2),2)"
    ]
vars = [
    "def X = 5", 
    "def Y = 10"
    ]
