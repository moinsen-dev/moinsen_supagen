import 'dart:io';

import 'package:antlr4/antlr4.dart';
import 'package:moinsen_supagen/gen/antlr/PrismaBaseVisitor.dart';
import 'package:moinsen_supagen/gen/antlr/PrismaLexer.dart';
import 'package:moinsen_supagen/gen/antlr/PrismaParser.dart';

void main() {
  final file = File('./lib/test.prisma');
  final input = file.readAsStringSync();

  final inputStream = InputStream.fromString(input);

  final lexer = PrismaLexer(inputStream);
  final tokenStream = CommonTokenStream(lexer);
  final parser = PrismaParser(tokenStream);

  // Fügen Sie einen ErrorListener hinzu, um Syntaxfehler zu erfassen
  parser.addErrorListener(ConsoleErrorListener.INSTANCE);

  // Fügen Sie einen ParseTreeListener hinzu, um die Ausgabe des Parsers zu erhalten
  final parseTreeListener = MyParseTreeListener();

  parser.addParseListener(parseTreeListener);

  // Überprüfen Sie, ob während des Parsens Fehler aufgetreten sind
  if (parser.numberOfSyntaxErrors > 0) {
    print('Syntax errors found: ${parser.numberOfSyntaxErrors}');
    return;
  }

  final parseTree = parser.prismaFile();

  final visitor = SQLGenerator();
  final sql = visitor.visit(parseTree);

  print(sql);
}

class MyParseTreeListener extends ParseTreeListener {
  @override
  void visitTerminal(TerminalNode node) {
    print('Terminal: ${node.text}');
  }

  @override
  void visitErrorNode(ErrorNode node) {
    print('Error: ${node.text}');
  }

  @override
  void enterEveryRule(ParserRuleContext ctx) {
    print('EnterRule: ${ctx.runtimeType}');
  }

  @override
  void exitEveryRule(ParserRuleContext ctx) {
    print('ExitRule: ${ctx.runtimeType}');
  }
}

class SQLGenerator extends PrismaBaseVisitor<String> {
  @override
  String? visitModel(ModelContext ctx) {
    return visitChildren(ctx);
  }
}
