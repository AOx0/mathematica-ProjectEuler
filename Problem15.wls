#!/usr/bin/env wolframscript
(* ::Package:: *)

LetticePaths[S_List] := (
    n = S[[1]];
    k = S[[2]];
    BinomialC = {n + k, n};
    Print[BinomialC, " = ", ToString[BinomialC[[1]]]! / (ToString[BinomialC[[2]]]! (ToString[BinomialC[[1]]] - ToString[BinomialC[[2]]])!)];
    Print["Result = ", BinomialC[[1]]! / (BinomialC[[2]]! (BinomialC[[1]] - BinomialC[[2]])!)]
)

LetticePaths[{20, 20}]
