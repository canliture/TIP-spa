parser grammar TipParser;

options { tokenVocab=TipLexer; }

@header {
    package com.shengid.tipj.frontend;
}

program
    : fun*
    ;

fun
    : ID paramList funBody
    ;

funBody
    : '{' varDecls? bodyStmt ret '}'
    ;

paramList
    : '(' ( ID (',' ID)* )? ')'
    ;

varDecls
    : 'var' ID (',' ID)* ';'
    ;

ret
    : 'return' expr ';'
    ;

expr
    : INT
    | ID
    | INPUT
    | NULL
    | expr bop=('+' | '-' | '*' | '/' | '%') expr
    | expr bop=('>' | '==') expr
    | parenExpr
    | callExpr
    | allocExpr
    | addrExpr
    | derefExpr
    | expr '.' ID   // field reference
    | recordExpr
    ;

parenExpr
    : '(' expr ')'
    ;

callExpr
    : ID argList
    ;

argList
    : '(' ( expr (',' expr)* )? ')'
    ;

allocExpr
    : 'alloc' expr
    ;

addrExpr
    : '&' expr
    ;

derefExpr
    : '*' expr
    ;

recordExpr
    : '{' ID ':' expr (',' ID ':' expr)* '}'
    ;

bodyStmt
    : stmt*
    ;

stmt
    : assignStmt
    | outStmt
    | ifStmt
    | whileStmt
    | pointerStoreStmt
    | recordStoreStmt
    ;

assignStmt
    : ID '=' expr ';'
    ;

pointerStoreStmt
    : '*' expr '=' expr ';'
    ;

recordStoreStmt
    : ID '.' ID '=' expr ';'
    | '(' '*' expr ')' '.' ID '=' expr ';'
    ;

ifStmt
    : 'if' '(' expr ')' '{' bodyStmt '}' ('else' '{' bodyStmt '}')?
    ;

whileStmt
    : 'while' '(' expr ')' '{' bodyStmt '}'
    ;

outStmt
    : 'output' expr ';'
    ;