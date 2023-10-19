import 'dart:convert';
import 'dart:io';

import 'package:moinsen_supagen/src/commands/supabase/sql_helper.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_infos.dart';
import 'package:moinsen_supagen/src/commands/supabase/sql_table_relations.dart';

const filenameSqlTableInfos = 'input/table_infos.sql';
const filenameSqlRelationInfos = 'input/table_relations.sql';

Future<bool> generateFile(String outputDir) async {
  final tableRelations = await executeSql(
    sqlStatement: sqlTableRelations,
    filetype: 'table-relations',
  );

  final tableInfos = await executeSql(
    sqlStatement: sqlTableInfos,
    filetype: 'table-infos',
  );

  if (tableRelations != null && tableInfos != null) {
    final result = await writeToFile(
      jsonStringTableInfos: tableInfos,
      jsonStringTableRelations: tableRelations,
      outputDir: outputDir,
    );

    if (result == null) {
      return true;
    }
  }

  return false;
}

Future<String?> writeToFile({
  required String jsonStringTableInfos,
  required String jsonStringTableRelations,
  required String outputDir,
}) async {
  try {
    final directory = Directory(outputDir);
    if (!directory.existsSync()) {
      await directory.create();
    }

    final jsonTI = jsonDecode(jsonStringTableInfos)[0]['tables_infos'];
    final jsonTR = jsonDecode(jsonStringTableRelations)[0]['tables_relations'];

    final json = <String, dynamic>{
      'tables_relations': jsonTR,
      'tables_infos': jsonTI,
    };

    const encoder = JsonEncoder.withIndent('  ');
    final jsonString = encoder.convert(json);
    final file = File('${directory.path}/table-infos.json');
    await file.writeAsString(jsonString);

    return null; // Success
  } catch (e) {
    return 'Exception: $e';
  }
}
