#!/usr/bin/env wolframscript
(* ::Package:: *)

SumDivisors[n_] := (
    sum = 0;
    (sum += #)& /@ DeleteCases[Divisors[n], n];
    Return[sum]
);
GetType[n_] := (
    m = SumDivisors[n]; Which[
        m > n, Return[1]
        ,
        m < n, Return[2]
        ,
        m == n, Return[0]
    ]
);
AbundantNums = {}; (If[GetType[#] == 1, AppendTo[AbundantNums, #]])& /@ Range[1, 28123];
AbundantNums = DeleteCases[AbundantNums /. x_ /; x >= 28123 -> 0, 0];
Print["Abundant numbers calculated"]

ListSums = {};
Do[
    (
        Sums = {};
        Do[(Summ = AbundantNums[[i]] + AbundantNums[[j]]; If[Summ < 28124,
            AppendTo[Sums, Summ],
            Continue[]
        ]), {j, i, Length[AbundantNums]}];
        AppendTo[ListSums, Sums];
    ),
    {i, 1, Length[AbundantNums]}
]
Print["Sums of all Abundants calculated"]
ListaFinal = DeleteDuplicates[Flatten[ListSums]];

Universo = DeleteCases[Range[1, 28123] /. x_ /; MemberQ[ListaFinal, x] -> 0, 0];
Print[Sum[k, {k, Universo}]]

