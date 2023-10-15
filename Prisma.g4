grammar Prisma;

// Parser rules

prismaFile: (COMMENT | LINE_COMMENT | dataSource | generator | model | enumDef)* EOF;

dataSource: DATASOURCE IDENT LBRACE setting* RBRACE;
generator: GENERATOR IDENT LBRACE setting* RBRACE;

model: MODEL IDENT LBRACE (modelField | modelAnnotation)* RBRACE;

modelField: IDENT fieldType QUESTION_MARK? directives? SEMICOLON?;

fieldType
    : baseType
    | arrayType
    | function
    | modelType
    ;

baseType: INT | STRING | BOOLEAN | DATETIME;
arrayType: (baseType | modelType) LBRACKET RBRACKET; // Updated this rule
modelType: IDENT;

directives: directive (directive)*;
directive: FIELD_DIRECTIVE IDENT directiveArguments?;

modelAnnotation: MODEL_DIRECTIVE IDENT directiveArguments? SEMICOLON?;

directiveArguments: LPAREN directiveArgument (COMMA directiveArgument)* RPAREN;
directiveArgument: IDENT COLON value | value | function;

value
    : STRING_LITERAL
    | NUMBER
    | BOOLEAN_LITERAL
    | array
    | function
    | IDENT
    ;

array: LBRACKET value (COMMA value)* RBRACKET;

enumDef: ENUM IDENT LBRACE enumValue* RBRACE;
enumValue: IDENT SEMICOLON?;

setting: IDENT EQUALS (function | STRING_LITERAL | IDENT) SEMICOLON?;

function: IDENT LPAREN (value (COMMA value)*)? RPAREN;

// Lexer rules

DATASOURCE: 'datasource';
GENERATOR: 'generator';
MODEL: 'model';
ENUM: 'enum';
INT: 'Int';
STRING: 'String';
BOOLEAN: 'Boolean';
DATETIME: 'DateTime';
FIELD_DIRECTIVE: '@';
MODEL_DIRECTIVE: '@@';
LBRACE: '{';
RBRACE: '}';
LBRACKET: '[';
RBRACKET: ']';
LPAREN: '(';
RPAREN: ')';
COMMA: ',';
EQUALS: '=';
COLON: ':';
SEMICOLON: ';';
QUESTION_MARK: '?';

BOOLEAN_LITERAL: 'true' | 'false';
IDENT: [a-zA-Z_][a-zA-Z_0-9]*;
STRING_LITERAL: '"' ('\\' . | ~['\\])* '"';
NUMBER: '-'? [0-9]+ ('.' [0-9]+)?;
WS: [ \t\r\n]+ -> skip;
LINE_COMMENT: '//' ~[\r\n]* -> skip;
COMMENT: '/*' .*? '*/' -> skip;
