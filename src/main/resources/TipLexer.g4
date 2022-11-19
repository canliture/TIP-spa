lexer grammar TipLexer;

@header {
    package com.shengid.tipj.frontend;
}

LPAREN:               '(';
RPAREN:               ')';
LBRACE:               '{';
RBRACE:               '}';
SEMI:                 ';';
COMMA:                ',';
ASSIGN:               '=';
GT:                   '>';
EQ:                   '==';
PLUS:                 '+';
MINUS:                '-';
STAR:                 '*';
DIV:                  '/';
MOD:                  '%';
ADDRESS:              '&';
DOT:                  '.';
COLON:                ':';

// keywords
VAR:                  'var';
RETURN:               'return';
INPUT:                'input';  
OUTPUT:               'output';
IF:                   'if';
WHILE:                'while';
ELSE:                 'else';
ALLOC:                'alloc';
NULL:                 'null';

fragment DIGIT      : [0-9];
INT : DIGIT+;

fragment IDNonDigit : [$_a-zA-Z];
ID  : IDNonDigit (IDNonDigit | DIGIT)*;

WS  : [ \t\r\n]+ -> skip;
LINE_COMMENT : '//' ~[\r\n]* -> skip;
COMMENT      : '/*' .*? '*/' -> skip;
