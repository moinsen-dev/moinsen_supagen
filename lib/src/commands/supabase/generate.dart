import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/supabase/sql_enums.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_helper.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_infos.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_relations.dart';

const filenameSqlTableInfos = 'input/table_infos.sql';
const filenameSqlRelationInfos = 'input/table_relations.sql';

Future<bool> generateFile(String outputDir) async {
  final tableRelations = await executeSql(
    sqlStatement: sqlTableRelations,
  );

  final tableInfos = await executeSql(
    sqlStatement: sqlTableInfos,
  );

  final dbEnums = await executeSql(
    sqlStatement: sqlEnums,
  );

  final result = await writeToFile(
    sqlMap: {
      'tables_relations': tableRelations,
      'tables_infos': tableInfos,
      'db_enums': dbEnums,
    },
    outputDir: outputDir,
  );

  if (result == null) {
    return true;
  }

  return false;
}

Future<String?> writeToFile({
  required Map<String, String?> sqlMap,
  required String outputDir,
}) async {
  try {
    final directory = Directory(outputDir);
    if (!directory.existsSync()) {
      await directory.create();
    }

    final json = <String, dynamic>{};
    for (final entry in sqlMap.entries) {
      final key = entry.key;
      final jsonString = entry.value;
      if (jsonString != null) {
        final jsonEntry = jsonDecode(jsonString)[0][key];
        json[key] = jsonEntry;
      }
    }

    const encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(json);
    final file = File('${directory.path}/db-infos.json');
    await file.writeAsString(jsonString);

    return null; // Success
  } catch (e) {
    return 'Exception: $e';
  }
}
