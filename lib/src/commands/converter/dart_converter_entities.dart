// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/entity_templates.dart';
import 'package:moinsen_supagen/src/commands/converter/utils.dart';
import 'package:simple_mustache/simple_mustache.dart';

Future<void> generateEntityFiles(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final inputJson = jsonDecode(input);
  final json = inputJson['tables'] as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final indexFileName = '$outputDir/_index.dart';
  final fileIndex = File(indexFileName);
  final sinkIndex = fileIndex.openWrite();

  for (final schema in json.keys) {
    await generateEntityFilesForSchema(
      schema,
      outputDir,
      json[schema] as List<dynamic>,
    );

    sinkIndex.write("export '$schema/_index.dart';\n");
  }

  await sinkIndex.close();
}

Future<void> generateEntityFilesForSchema(
  String schema,
  String dir,
  List<dynamic> json,
) async {
  final outputDir = '$dir/$schema';
  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final indexFileName = '$outputDir/_index.dart';
  final fileIndex = File(indexFileName);
  final sinkIndex = fileIndex.openWrite();

  for (final data in json) {
    final table = data['table'] as String;
    final schemaTable = schema == 'public'
        ? data['table'] as String
        : '$schema.${data['table'] as String}';
    final columns = data['columns'] as List<dynamic>;
    final content = StringBuffer();
    final staticContent = StringBuffer();

    final modifiedTable = modifyTableName(
      table,
    ); // Verwendet die modifyTableName Funktion
    final pascalCaseTable = toPascalCase(modifiedTable);
    final fileName = '$outputDir/$modifiedTable.dart';

    sinkIndex.write("export '$modifiedTable.dart';\n");

    final file = File(fileName);
    final sink = file.openWrite();

    final fields = sortAndFilterByName(columns);
    // -- Generate all attributes as constants
    final pkKey = <String>[];
    for (final field in fields) {
      final fieldName = field['name'] as String;
      final attrName = 'attr${toPascalCase(fieldName)}';
      staticContent.writeln("  static const $attrName = '$fieldName';");

      final keyInformations = erdKey(field['keyInformations'] as String);
      if (keyInformations.contains('PK')) {
        pkKey.add(fieldName);
      }
    }

    // Convert pkKey to a list of quoted strings
    final pkKeyString = pkKey.map((e) => "'$e'").join(', ');
    staticContent.writeln('\n  static const pkKey= [$pkKeyString];');

    for (final field in fields) {
      final fieldName = field['name'] as String;
      final camelCaseName = toCamelCase(fieldName);
      final type = dartType(field['type'] as String);

      var nullable = '';
      if (field['name'] != 'id') {
        nullable = field['nullable'] as bool ? '?' : '';
      } else {
        nullable = '?'; // Setzt id Feld als nullable
      }

      content.writeln('  final $type$nullable $camelCaseName;');
    }

    content.writeln('\n  const $pascalCaseTable({');
    for (final field in fields) {
      final fieldName = field['name'] as String;
      final camelCaseName = toCamelCase(fieldName);
      var required = '';
      if (field['name'] != 'id') {
        required = field['nullable'] as bool ? '' : 'required ';
      }

      content.writeln('    ${required}this.$camelCaseName,');
    }

    content.writeln('  });');

    final mTmplMap = Mustache(
      map: {
        'entity': pascalCaseTable,
        'tableName': schemaTable,
        'filename': modifiedTable,
        'dollarEntity': '\$$pascalCaseTable',
        'content': content.toString(),
        'staticContent': staticContent.toString(),
      },
    );
    final entityClass = mTmplMap.convert(templateDartEntity);
    sink.write(entityClass);

    await sink.close();
  }

  await sinkIndex.close();
}
