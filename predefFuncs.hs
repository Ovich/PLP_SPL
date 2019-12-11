module predefFuncs
(
    funcs,
)

where

funcs = [
"def pred N = N - 1",
"def fact N = if N then N * fact(pred (N)) else 1"
"def succ N = N + 1"
"def add N M = N + M"
"def sub N M = N - M"
"def pow N M = N ^ M"
"def abs N = if N then N else -N"
"def sum N = if N then N + sum(pred(N)) else 0"
"def even N = N % 2"
"def collatz N = if N == 1 then 0 else if even(N) then 1 + collatz(N / 2) else 1 + collatz(N * 3 + 1)"
"def div N M = N / M"
"def modulos N M = N % M"
"def ackermann N M = if M == 0 then succ(N) else if N == 0 then ackermann(pred(M), 1) else ackermann(pred(M), ackermann(M, pred(N)))"
]