// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/utils.dart';

Future<void> generateEnumFile(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final inputJson = jsonDecode(input);
  final jsonAll = inputJson['enums'] as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  for (final schema in jsonAll.keys) {
    await generateEnumFileFromSchema(
      schema,
      outputDir,
      jsonAll[schema] as List<dynamic>,
    );
  }
}

Future<void> generateEnumFileFromSchema(
  String schema,
  String dir,
  List<dynamic> json,
) async {
  final outputDir = '$dir/$schema';
  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  // Append enums.dart to _index.dart
  final indexFileName = '$outputDir/_index.dart';
  final fileIndex = File(indexFileName);
  final sinkIndex = fileIndex.openWrite(mode: FileMode.append);
  sinkIndex.write("export 'enums.dart';\n");
  await sinkIndex.close();

  final fileName = '$outputDir/enums.dart';
  final file = File(fileName);
  final sink = file.openWrite();
  for (final e in json) {
    final enumMap = e as Map<String, dynamic>;
    final key = enumMap['name'] as String;
    final values = enumMap['values'] as List<dynamic>;

    final modifiedEnums = modifyTableName(key);
    final pascalCaseEnums = toPascalCase(modifiedEnums);

    sink.write('enum $pascalCaseEnums {\n');

    for (final value in values) {
      final enumString = toCamelCase(value as String);
      sink.write('  $enumString,\n');
    }

    sink.write('}\n\n');
  }

  await sink.close();
}
