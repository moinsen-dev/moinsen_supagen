// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/utils.dart';
import 'package:path/path.dart' as p;

Future<void> generateErdFile(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final json = jsonDecode(input) as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final outErdFilename = p.basename(inputFile);

  final erdFileName = '$outputDir/erd-$outErdFilename.mmd';
  final erdFile = File(erdFileName);
  final sink = erdFile.openWrite();

  sink.write('erDiagram\n');

  for (final table in json.keys) {
    final pascalCaseTable = toPascalCase(table);

    sink.write('\t$pascalCaseTable {\n');

    final fields = sortAndFilterByName(json[table] as List<dynamic>);
    for (final field in fields) {
      final lowerCaseName = (field['name'] as String).toLowerCase();
      final type = erdType(field['type'] as String).toLowerCase();
      final isRequired = field['nullable'] as bool ? 'NULLABLE' : '';
      final keyInformations = erdKey(field['keyInformations'] as String);
      final comment = field['comment'] as String? ?? '';
      final fieldAddInfo = isArray(type) ? 'ARRAY,' : '';
      final commentInfo = '"$isRequired, $fieldAddInfo, $comment, "';
      sink.write(
        '\t\t$type $lowerCaseName $keyInformations $commentInfo\n',
      );
    }

    sink.write('\t}\n\n');
  }

  await sink.close();
}

String erdKey(String key) {
  if (key == 'PRIMARY KEY') {
    return 'PK';
  } else if (key == 'FOREIGN KEY') {
    return 'FK';
  }

  return '';
}

bool isArray(String type) {
  return type.startsWith('_');
}

String erdType(String type) {
  if (isArray(type)) {
    final elementType = baseType(type.substring(1));
    return elementType;
  }

  return baseType(type);
}
