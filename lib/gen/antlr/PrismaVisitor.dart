// Generated from Prisma.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'PrismaParser.dart';

/// This abstract class defines a complete generic visitor for a parse tree
/// produced by [PrismaParser].
///
/// [T] is the eturn type of the visit operation. Use `void` for
/// operations with no return type.
abstract class PrismaVisitor<T> extends ParseTreeVisitor<T> {
  /// Visit a parse tree produced by [PrismaParser.prismaFile].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitPrismaFile(PrismaFileContext ctx);

  /// Visit a parse tree produced by [PrismaParser.dataSource].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDataSource(DataSourceContext ctx);

  /// Visit a parse tree produced by [PrismaParser.generator].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitGenerator(GeneratorContext ctx);

  /// Visit a parse tree produced by [PrismaParser.model].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitModel(ModelContext ctx);

  /// Visit a parse tree produced by [PrismaParser.modelField].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitModelField(ModelFieldContext ctx);

  /// Visit a parse tree produced by [PrismaParser.fieldType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFieldType(FieldTypeContext ctx);

  /// Visit a parse tree produced by [PrismaParser.baseType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitBaseType(BaseTypeContext ctx);

  /// Visit a parse tree produced by [PrismaParser.arrayType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitArrayType(ArrayTypeContext ctx);

  /// Visit a parse tree produced by [PrismaParser.modelType].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitModelType(ModelTypeContext ctx);

  /// Visit a parse tree produced by [PrismaParser.directives].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDirectives(DirectivesContext ctx);

  /// Visit a parse tree produced by [PrismaParser.directive].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDirective(DirectiveContext ctx);

  /// Visit a parse tree produced by [PrismaParser.modelAnnotation].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitModelAnnotation(ModelAnnotationContext ctx);

  /// Visit a parse tree produced by [PrismaParser.directiveArguments].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDirectiveArguments(DirectiveArgumentsContext ctx);

  /// Visit a parse tree produced by [PrismaParser.directiveArgument].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitDirectiveArgument(DirectiveArgumentContext ctx);

  /// Visit a parse tree produced by [PrismaParser.value].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitValue(ValueContext ctx);

  /// Visit a parse tree produced by [PrismaParser.array].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitArray(ArrayContext ctx);

  /// Visit a parse tree produced by [PrismaParser.enumDef].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitEnumDef(EnumDefContext ctx);

  /// Visit a parse tree produced by [PrismaParser.enumValue].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitEnumValue(EnumValueContext ctx);

  /// Visit a parse tree produced by [PrismaParser.setting].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitSetting(SettingContext ctx);

  /// Visit a parse tree produced by [PrismaParser.function].
  /// [ctx] the parse tree.
  /// Return the visitor result.
  T? visitFunction(FunctionContext ctx);
}