#!/usr/bin/env wolframscript
(* ::Package:: *)

GetChars[n_Integer] := (
    Characters[ToString[n]]
)
SumDigitsOf[n_Integer] := (
    Result = {};
    Do[AppendTo[Result, ToExpression[x]], {x, GetChars[n]}];
    Return[Sum[y!, {y, Result}]]
)

CurrentNumber = 3;
TotalSum = 0;
While[True,
    If[SumDigitsOf[CurrentNumber] == CurrentNumber,
        TotalSum += CurrentNumber;
        Print[TotalSum];
        CurrentNumber += 1
        ,
        CurrentNumber += 1
    ]
]



