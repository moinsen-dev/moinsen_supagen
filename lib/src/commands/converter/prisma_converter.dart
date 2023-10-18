// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/converter/utils.dart';

Future<void> generatePrismaFile(String inputFile, String outputDir) async {
  final input = await File(inputFile).readAsString();
  final list = jsonDecode(input);
  final json = list[0]['tables_info'] as Map<String, dynamic>;

  final directory = Directory(outputDir);
  if (!directory.existsSync()) {
    await directory.create();
  }

  final prismaFileName = '$outputDir/schema.prisma';
  final prismaFile = File(prismaFileName);
  final sink = prismaFile.openWrite();

  for (final table in json.keys) {
    final pascalCaseTable = toPascalCase(table);

    sink.write('model $pascalCaseTable {\n');

    final fields = sortAndFilterByName(json[table] as List<dynamic>);
    for (final field in fields) {
      final camelCaseName = toCamelCase(field['name'] as String);
      final type = prismaType(field['type'] as String);
      final isRequired =
          field['nullable'] as bool ? '' : ' @default(autoincrement())';
      final isId = field['name'] == 'id' ? ' @id' : '';
      sink.write('  $camelCaseName $type$isRequired$isId\n');
    }

    sink.write('}\n\n');
  }

  await sink.close();
}

String prismaType(String type) {
  if (type.startsWith('_')) {
    final elementType = baseType(type.substring(1));
    return toPascalCase('$elementType[]');
  }

  return toPascalCase(baseType(type));
}
