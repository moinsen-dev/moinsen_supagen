// Generated from Prisma.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'PrismaParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [PrismaParser].
abstract class PrismaListener extends ParseTreeListener {
  /// Enter a parse tree produced by [PrismaParser.prismaFile].
  /// [ctx] the parse tree
  void enterPrismaFile(PrismaFileContext ctx);
  /// Exit a parse tree produced by [PrismaParser.prismaFile].
  /// [ctx] the parse tree
  void exitPrismaFile(PrismaFileContext ctx);

  /// Enter a parse tree produced by [PrismaParser.dataSource].
  /// [ctx] the parse tree
  void enterDataSource(DataSourceContext ctx);
  /// Exit a parse tree produced by [PrismaParser.dataSource].
  /// [ctx] the parse tree
  void exitDataSource(DataSourceContext ctx);

  /// Enter a parse tree produced by [PrismaParser.generator].
  /// [ctx] the parse tree
  void enterGenerator(GeneratorContext ctx);
  /// Exit a parse tree produced by [PrismaParser.generator].
  /// [ctx] the parse tree
  void exitGenerator(GeneratorContext ctx);

  /// Enter a parse tree produced by [PrismaParser.model].
  /// [ctx] the parse tree
  void enterModel(ModelContext ctx);
  /// Exit a parse tree produced by [PrismaParser.model].
  /// [ctx] the parse tree
  void exitModel(ModelContext ctx);

  /// Enter a parse tree produced by [PrismaParser.modelField].
  /// [ctx] the parse tree
  void enterModelField(ModelFieldContext ctx);
  /// Exit a parse tree produced by [PrismaParser.modelField].
  /// [ctx] the parse tree
  void exitModelField(ModelFieldContext ctx);

  /// Enter a parse tree produced by [PrismaParser.fieldType].
  /// [ctx] the parse tree
  void enterFieldType(FieldTypeContext ctx);
  /// Exit a parse tree produced by [PrismaParser.fieldType].
  /// [ctx] the parse tree
  void exitFieldType(FieldTypeContext ctx);

  /// Enter a parse tree produced by [PrismaParser.baseType].
  /// [ctx] the parse tree
  void enterBaseType(BaseTypeContext ctx);
  /// Exit a parse tree produced by [PrismaParser.baseType].
  /// [ctx] the parse tree
  void exitBaseType(BaseTypeContext ctx);

  /// Enter a parse tree produced by [PrismaParser.arrayType].
  /// [ctx] the parse tree
  void enterArrayType(ArrayTypeContext ctx);
  /// Exit a parse tree produced by [PrismaParser.arrayType].
  /// [ctx] the parse tree
  void exitArrayType(ArrayTypeContext ctx);

  /// Enter a parse tree produced by [PrismaParser.modelType].
  /// [ctx] the parse tree
  void enterModelType(ModelTypeContext ctx);
  /// Exit a parse tree produced by [PrismaParser.modelType].
  /// [ctx] the parse tree
  void exitModelType(ModelTypeContext ctx);

  /// Enter a parse tree produced by [PrismaParser.directives].
  /// [ctx] the parse tree
  void enterDirectives(DirectivesContext ctx);
  /// Exit a parse tree produced by [PrismaParser.directives].
  /// [ctx] the parse tree
  void exitDirectives(DirectivesContext ctx);

  /// Enter a parse tree produced by [PrismaParser.directive].
  /// [ctx] the parse tree
  void enterDirective(DirectiveContext ctx);
  /// Exit a parse tree produced by [PrismaParser.directive].
  /// [ctx] the parse tree
  void exitDirective(DirectiveContext ctx);

  /// Enter a parse tree produced by [PrismaParser.modelAnnotation].
  /// [ctx] the parse tree
  void enterModelAnnotation(ModelAnnotationContext ctx);
  /// Exit a parse tree produced by [PrismaParser.modelAnnotation].
  /// [ctx] the parse tree
  void exitModelAnnotation(ModelAnnotationContext ctx);

  /// Enter a parse tree produced by [PrismaParser.directiveArguments].
  /// [ctx] the parse tree
  void enterDirectiveArguments(DirectiveArgumentsContext ctx);
  /// Exit a parse tree produced by [PrismaParser.directiveArguments].
  /// [ctx] the parse tree
  void exitDirectiveArguments(DirectiveArgumentsContext ctx);

  /// Enter a parse tree produced by [PrismaParser.directiveArgument].
  /// [ctx] the parse tree
  void enterDirectiveArgument(DirectiveArgumentContext ctx);
  /// Exit a parse tree produced by [PrismaParser.directiveArgument].
  /// [ctx] the parse tree
  void exitDirectiveArgument(DirectiveArgumentContext ctx);

  /// Enter a parse tree produced by [PrismaParser.value].
  /// [ctx] the parse tree
  void enterValue(ValueContext ctx);
  /// Exit a parse tree produced by [PrismaParser.value].
  /// [ctx] the parse tree
  void exitValue(ValueContext ctx);

  /// Enter a parse tree produced by [PrismaParser.array].
  /// [ctx] the parse tree
  void enterArray(ArrayContext ctx);
  /// Exit a parse tree produced by [PrismaParser.array].
  /// [ctx] the parse tree
  void exitArray(ArrayContext ctx);

  /// Enter a parse tree produced by [PrismaParser.enumDef].
  /// [ctx] the parse tree
  void enterEnumDef(EnumDefContext ctx);
  /// Exit a parse tree produced by [PrismaParser.enumDef].
  /// [ctx] the parse tree
  void exitEnumDef(EnumDefContext ctx);

  /// Enter a parse tree produced by [PrismaParser.enumValue].
  /// [ctx] the parse tree
  void enterEnumValue(EnumValueContext ctx);
  /// Exit a parse tree produced by [PrismaParser.enumValue].
  /// [ctx] the parse tree
  void exitEnumValue(EnumValueContext ctx);

  /// Enter a parse tree produced by [PrismaParser.setting].
  /// [ctx] the parse tree
  void enterSetting(SettingContext ctx);
  /// Exit a parse tree produced by [PrismaParser.setting].
  /// [ctx] the parse tree
  void exitSetting(SettingContext ctx);

  /// Enter a parse tree produced by [PrismaParser.function].
  /// [ctx] the parse tree
  void enterFunction(FunctionContext ctx);
  /// Exit a parse tree produced by [PrismaParser.function].
  /// [ctx] the parse tree
  void exitFunction(FunctionContext ctx);
}