// ignore_for_file: avoid_dynamic_calls, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/utils.dart';
import 'package:path/path.dart' as p;

/*
TODO(udi): Sort by ids Fields, first PK, then FK, then others last _at fields
*/

Future<void> generateErdFile(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final jsonInput = jsonDecode(input);
  final json = jsonInput['tables_infos'] as Map<String, dynamic>;
  final jsonRelations = jsonInput['tables_relations'] as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final outErdFilename = p.basename(inputFile);

  final erdFileName = '$outputDir/erd-$outErdFilename.mmd';
  final erdFile = File(erdFileName);
  final sink = erdFile.openWrite();

  sink.write('erDiagram\n');

  final sortedKeys = sortTablesByGroups(json.keys);
  for (final table in sortedKeys) {
    final upperName = table.toUpperCase();

    final relations = jsonRelations[table] as String?;

    if (relations != null && relations.isNotEmpty) {
      sink.write('\t$relations: tbd\n'.toUpperCase());
    }

    sink.write('\t$upperName {\n');

    final fields = sortAndFilterByName(json[table] as List<dynamic>);
    for (final field in fields) {
      final lowerCaseName = (field['name'] as String).toLowerCase();
      final isRequired = field['nullable'] as bool ? 'NULLABLE' : '';
      final keyInformations = erdKey(field['keyInformations'] as String);
      final type = erdType(field['type'] as String).toLowerCase();
      final fieldAddInfo = isArray(type) ? 'ARRAY,' : '';
      final comment = field['comment'] as String? ?? '';
      const commentInfo = '';
      //'"$isRequired, $fieldAddInfo, $comment, "';
      sink.write(
        '\t\t$type $lowerCaseName $keyInformations $commentInfo\n',
      );
    }

    sink.write('\t}\n\n');
  }

  await sink.close();
}
