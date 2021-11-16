## pt_compiler
Este repositorio é para construção do front-end de um compilador, e o projeto foi baseado no video de youtube do professor Isidro, nele o professor definiu uma gramatica para sua linguagem e a chamou de Isi. 

https://www.youtube.com/watch?v=6Z1vwE5XoMg -> video de referencia.
https://www.professorisidro.com.br/compiladores/ -> gramatica de referencia.

Este projeto utilizou a mesma gramatica definida pelo professor e com regras gramaticas estendidadas.

Analisador Sintático

 (01) Prog       -> programa Declara Bloco fimprog.
 (02) Declara    -> declare Id (, Id)* .
 (03) Bloco      -> (Cmd. )+
 (04) Cmd        -> CmdLeitura | CmdEscrita | CmdExpr | CmdIf
 (05) CmdLeitura -> leia( Id )
 (06) CmdEscrita -> escreva( Texto | Id )
 (07) CmdSe      -> se ( logica )
 (07) CmdPara    -> se 
 (09) CmdExpr    -> Id := Expr
 (10) Expr       -> Expr + Termo  | Expr – Termo  | Termo
 (11) Termo      -> Termo * Fator | Termo / Fator | Fator
 (12) logica     -> Fator > | < | = | ! Fator
 (13) Fator      -> Num | Id | ( Expr )
 
 Tokens

(01) Id     -> (a..z | A..Z) (a..z | A..Z | 0..9)*
(02) Num    -> (0..9)+
(03) soma   -> +
(04) soma   -> +
(05) subt   -> -
(06) mult   -> *
(07) divi   -> /
(08) maior  -> >
(09) menor  -> <
(10) igual  -> =
(11) dif    -> !
(12) attr   -> :=
(13) Texto  -> “(0..9 | a..z | A..Z | ‘ ‘ | )+ ”

 
