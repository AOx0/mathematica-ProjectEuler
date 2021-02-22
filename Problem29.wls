#!/usr/bin/env wolframscript
(* ::Package:: *)

GetPowers[n_Integer, y_Integer] := (
    Powers = {};
    For[base = 2, base <= n, base++, 
        For[exponent = 2, exponent <= y, exponent++, 
            AppendTo[Powers, base^exponent]
        ]
    ];
    Return[Sort[DeleteDuplicates[Powers]]]
)

Print[Length[GetPowers[100, 100]]]
