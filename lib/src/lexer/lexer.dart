import 'dart:core';

enum TokenType {
  datasource,
  generator,
  model,
  enumeration,
  identifier,
  equals,
  string,
  openBrace,
  closeBrace,
  function,
  openParen,
  closeParen,
  openBracket,
  closeBracket,
  datasourceToken,
  generatorToken,
  modelToken
}

enum DatasourceTokenType {
  provider,
  url,
  shadowDatabaseUrl,
  directUrl,
  relationMode,
  extensions
}

enum GeneratorTokenType {
  provider,
  output,
  previewFeatures,
  engineType,
  binaryTargets
}

enum ModelTokenType {
  unique,
  id,
  doubleUnique,
  doubleId,
  // Andere spezifische Model-Token können hier hinzugefügt werden
}

class Token {
  Token(
    this.type,
    this.lexeme,
    this.line, {
    this.datasourceTokenType,
    this.generatorTokenType,
    this.modelTokenType,
  });
  final TokenType type;
  final DatasourceTokenType? datasourceTokenType;
  final GeneratorTokenType? generatorTokenType;
  final ModelTokenType? modelTokenType;
  final String lexeme;
  final int line;
}

class Lexer {
  Lexer(this.input);
  final String input;
  final List<Token> tokens = [];
  int start = 0;
  int current = 0;
  int line = 1;

  void scanTokens() {
    while (!isAtEnd) {
      start = current;
      scanToken();
    }
  }

  bool get isAtEnd => current >= input.length;

  void string() {
    while (peek() != '"' && !isAtEnd) {
      if (peek() == '\n') line++;
      advance();
    }
    if (isAtEnd) {
      error('Unterminated string.');
      return;
    }
    advance(); // The closing ".
    addToken(TokenType.string);
  }

  void scanToken() {
    final c = advance();
    switch (c) {
      case ' ':
      case '\r':
      case '\t':
        break;
      case '\n':
        line++;
      case '{':
        addToken(TokenType.openBrace);
      case '}':
        addToken(TokenType.closeBrace);
      case '=':
        addToken(TokenType.equals);
      case '"':
        string();
      case '(':
        addToken(TokenType.openParen);
      case ')':
        addToken(TokenType.closeParen);
      case '[':
        addToken(TokenType.openBracket);
      case ']':
        addToken(TokenType.closeBracket);
      default:
        if (isAlpha(c)) {
          identifier();
        } else {
          error('Unexpected character.');
        }
        break;
    }
  }

  void identifier() {
    while (isAlpha(peek())) {
      advance();
    }
    final text = input.substring(start, current);
    TokenType type;
    DatasourceTokenType? datasourceTokenType;
    GeneratorTokenType? generatorTokenType;

    if (text == 'datasource') {
      type = TokenType.datasource;
    } else if (text == 'generator') {
      type = TokenType.generator;
    } else if (text == 'env') {
      type = TokenType.function;
    } else if (text == 'enum') {
      type = TokenType.enumeration;
    } else {
      String? tokenTypeString;
      try {
        tokenTypeString = DatasourceTokenType.values
            .firstWhere(
              (e) => e.toString().split('.').last == text,
            )
            .toString()
            .split('.')
            .last;
      } catch (e) {}
      if (tokenTypeString != null) {
        type = TokenType.datasourceToken;
        datasourceTokenType = DatasourceTokenType.values
            .firstWhere((e) => e.toString().split('.').last == tokenTypeString);
      } else {
        try {
          tokenTypeString = GeneratorTokenType.values
              .firstWhere(
                (e) => e.toString().split('.').last == text,
              )
              .toString()
              .split('.')
              .last;
        } catch (e) {}
        if (tokenTypeString != null) {
          type = TokenType.generatorToken;
          generatorTokenType = GeneratorTokenType.values.firstWhere(
            (e) => e.toString().split('.').last == tokenTypeString,
          );
        } else {
          type = TokenType.identifier;
        }
      }
    }

    addToken(
      type,
      datasourceTokenType: datasourceTokenType,
      generatorTokenType: generatorTokenType,
    );
  }

  void addToken(
    TokenType type, {
    DatasourceTokenType? datasourceTokenType,
    GeneratorTokenType? generatorTokenType,
    ModelTokenType? modelTokenType,
  }) {
    tokens.add(
      Token(
        type,
        input.substring(start, current),
        line,
        datasourceTokenType: datasourceTokenType,
        generatorTokenType: generatorTokenType,
        modelTokenType: modelTokenType,
      ),
    );
  }

  String advance() {
    current++;
    return input[current - 1];
  }

  String peek() => isAtEnd ? '0' : input[current];

  bool isAlpha(String c) => c.contains(RegExp('[a-zA-Z_]'));

  void error(String message) {
    print('Error on line $line: $message');
  }
}

void main() {
  const input = '''
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id      Int      @id @default(autoincrement())
  email   String   @unique
  name    String?
  role    Role     @default(USER)
  posts   Post[]
  profile Profile?
}

model Profile {
  id     Int    @id @default(autoincrement())
  bio    String
  user   User   @relation(fields: [userId], references: [id])
  userId Int    @unique
}

model Post {
  id         Int        @id @default(autoincrement())
  createdAt  DateTime   @default(now())
  updatedAt  DateTime   @updatedAt
  title      String
  published  Boolean    @default(false)
  author     User       @relation(fields: [authorId], references: [id])
  authorId   Int
  categories Category[]
  
  @@id([title(length: 100, sort: Desc), abstract(length: 10)])
  @@index([author, created_at(sort: Desc)])
}

model Category {
  id    Int    @id @default(autoincrement())
  name  String
  posts Post[]
}

enum Role {
  USER
  ADMIN
}''';
  final lexer = Lexer(input);
  lexer.scanTokens();
  for (final token in lexer.tokens) {
    print('Line ${token.line} ${token.type}: ${token.lexeme}');
  }
}
