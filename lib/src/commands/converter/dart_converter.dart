// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/utils.dart';

Future<void> generateDartFiles(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final list = jsonDecode(input);
  final json = list[0]['tables_info'] as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final indexFileName = '$outputDir/_index.dart';
  final fileIndex = File(indexFileName);
  final sinkIndex = fileIndex.openWrite();

  for (final table in json.keys) {
    final modifiedTable =
        modifyTableName(table); // Verwendet die modifyTableName Funktion
    final pascalCaseTable = toPascalCase(modifiedTable);
    final fileName = '$outputDir/$modifiedTable.dart';

    sinkIndex.write("export '$modifiedTable.dart';\n");

    final file = File(fileName);
    final sink = file.openWrite();

    sink.write(
      "import 'package:freezed_annotation/freezed_annotation.dart';\n",
    );
    sink.write("part '$modifiedTable.freezed.dart';\n");
    sink.write("part '$modifiedTable.g.dart';\n\n");
    sink.write('@freezed\n');
    sink.write('class $pascalCaseTable with _\$$pascalCaseTable {\n');
    sink.write('  const factory $pascalCaseTable({\n');

    final fields = sortAndFilterByName(json[table] as List<dynamic>);
    for (final field in fields) {
      final camelCaseName = toCamelCase(field['name'] as String);
      final type = dartType(field['type'] as String);
      var nullable = '';
      var required = '';
      if (field['name'] != 'id') {
        nullable = field['nullable'] as bool ? '?' : '';
        required = field['nullable'] as bool ? '' : 'required ';
      } else {
        nullable = '?'; // Setzt id Feld als nullable
      }
      sink.write('    $required$type$nullable $camelCaseName,\n');
    }

    sink.write('  }) = _$pascalCaseTable;\n\n');
    sink.write(
      '  factory $pascalCaseTable.fromJson(Map<String, Object?> json)'
      ' => _\$${pascalCaseTable}FromJson(json);\n',
    );
    sink.write('}\n');

    await sink.close();
  }

  await sinkIndex.close();
}

String dartType(String type) {
  if (type.startsWith('_')) {
    final elementType = baseType(type.substring(1));
    return 'List<$elementType>';
  }

  return baseType(type);
}
