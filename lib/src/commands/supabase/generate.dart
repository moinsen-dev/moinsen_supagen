import 'dart:io';

import 'package:moinsen_supagen/src/commands/supabase/sql_helper.dart';

const filenameSqlTableInfos = 'input/table_infos.sql';
const filenameSqlRelationInfos = 'input/table_relations.sql';

Future<String?> generateRelationFile(String outputDir) async {
  final sql = File(filenameSqlTableInfos).readAsStringSync();

  final result = await executeSqlAndWriteToFile(
    sqlStatement: sql,
    outputDir: outputDir,
    filetype: 'table-relations',
  );

  return result;
}

Future<String?> generateTableFile(String outputDir) async {
  final sql = File(filenameSqlRelationInfos).readAsStringSync();

  final result = await executeSqlAndWriteToFile(
    sqlStatement: sql,
    outputDir: outputDir,
    filetype: 'table-infos',
  );

  return result;
}
