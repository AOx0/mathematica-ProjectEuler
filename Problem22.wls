#!/usr/bin/env wolframscript
(* ::Package:: *)

NamesSet = StringSplit[StringReplace[URLRead["https://projecteuler.net/project/resources/p022_names.txt", {"Content"}]["Body"], {"\"" -> "", "," -> " "}], " "];
NameSetSorted = AlphabeticSort[NamesSet];
GenDict[] := (
    Alpha = CreateDataStructure["HashTable"];
    For[i = 1, i <= Length[Alphabet[]], i++, 
        Alpha["Insert", Part[ToUpperCase[Alphabet[]], i] -> i]
    ];
    For[j = 1, j <= Length[Alphabet[]], j++, 
        Alpha["Insert", Part[Alphabet[], j] -> j]
    ]
)

GenDict[]
GetNameNumbers[name_] := (
    nameNumbers = {};
    For[i = 1, i <= StringLength[name], i++, 
        AppendTo[nameNumbers, Alpha["Lookup", StringTake[name, {i}]]]
    ];
    Return[nameNumbers]
)
GetNameNumbersSum[name_] := (Sum[x, {x, GetNameNumbers[name]}])

For[x = 1; score = 0, x <= Length[NameSetSorted], x++, 
    score += (GetNameNumbersSum[Extract[NameSetSorted, {x}]] * x)
]

Print[score]
